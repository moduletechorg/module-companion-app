class ContactFormsController < ApplicationController
  def new
    current = ''
    if user_signed_in?
      current = current_user
    elsif admin_signed_in?
      current = current_admin
    end

    if current?
      @contact_form = ContactForm.new(name: "#{current.first_name} #{current.last_name}", email: current.email)
    end
  end

  def create
    current = ''
    if user_signed_in?
      current = current_user
    elsif admin_signed_in?
      current = current_admin
    end

    @contact_form = ContactForm.new(contact_form_params)
    @contact_form.name = "#{current.first_name} #{current.last_name}"
    @contact_form.email = current.email
    @contact_form.request = request

    if @contact_form.valid?
       @contact_form.deliver
    else
      flash[:danger] = "Error sending: #{@contact_form.errors.full_messages}"
      redirect_to root_path
    end
  end

  private

    def contact_form_params
      params.require(:contact_form).permit(:from_email, :from_name, :subject, :message, :to_email, :to_name, :lot_address)
    end
end
