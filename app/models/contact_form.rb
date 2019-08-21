class ContactForm < MailForm::Base
  attributes :name,     :validate => true
  attributes :email,    :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :message, :allow_blank => true
  attributes :lot_address,      :validate => true


  def headers
    {
      :subject => "#{name} would like more information about #{lot_address}",
      :to => "neha@modulehousing.com, pat@modulehousing.com",
      :from => %("#{name}" <#{email}>),
      :reply_to => email
    }
  end

end
