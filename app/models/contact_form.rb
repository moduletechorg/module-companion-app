class ContactForm < MailForm::Base
  attributes :name,     :validate => true
  attributes :email,    :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :message,  :validate => true
  attributes :lot_address,      :validate => true


  def headers
    {
      :subject => "#{name} would like more information about #{lot_address}",
      :to => "info@modulehousing.com, neha@modulehousing.com, tech@modulehousing.com, drew@modulehousing.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end
