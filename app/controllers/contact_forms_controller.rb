class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new(name: "#{current_user.first_name} #{current_user.last_name}", email: current_user.email)
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)
    @contact_form.name = "#{current_user.first_name} #{current_user.last_name}"
    @contact_form.email = current_user.email
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
