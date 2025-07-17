class ContactMailer < ApplicationMailer
  def contact_us
    @contact = params[:contact]
    @url = ""
    mail(to: @contact.email, subject: "Contact Me Form Submission")
  end

  def contact_us_admin
    @contact = params[:contact]
    @url = ""
    mail(to: ENV["GMAIL_USERNAME"], subject: "New Contact Form Submission")
  end
end
