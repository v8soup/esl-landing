class PagesController < ApplicationController
  before_action :set_headers
  allow_unauthenticated_access

  def index
    redirect_to contacts_path if authenticated?
    @header_3 = "Fluency doesn't come from flashcards."
    @page_title = "Home"
    @page_description = "Welcome to our ESL landing page. Here, we focus on helping you improve your English speaking skills with confidence and clarity."

    @contact = Contact.new
  end

  def submit_contact_us
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.with(contact: @contact).contact_us.deliver_now
      ContactMailer.with(contact: @contact).contact_us_admin.deliver_now
      redirect_to root_path, notice: "Thank you for contacting Me! We will get back to you as soon as possible."
    else
      @page_title = "Contact Us"
      render :index, status: :unprocessable_entity
    end
  end

  def class_info
    @courses = Course.where(active: true).order(year: :asc, title: :asc)

    @header_3 = "Class Info, Schedule, pricing and FAQs"
    @page_description = "Learn more about our mission to enhance English speaking skills for non-native speakers."
  end
end

private
  # Not used
  def set_headers
    @header ="ESL with Ramona"
    @header_2 = "Stop studying. Start speaking."
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :first_language, :subject, :message)
end
