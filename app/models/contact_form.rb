class ContactForm < MailForm::Base
  attribute :name
  attribute :email
  attribute :message

  def headers
    {
      :subject => "Lot info contact form",
      :to => "neha@modulehousing.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end
