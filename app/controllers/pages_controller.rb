class PagesController < ApplicationController
  # before_action :set_headers
  allow_unauthenticated_access

  def index
    redirect_to contacts_path if authenticated?
    @header = "ESL with Ramona"
    @header_2 = "Fluency doesn't come from flashcards"
    @header_3 = "Stop studying. Start speaking."
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
    @header = "ESL with Ramona"
    @header_2 = "Rapid English Fluency"
    @header_3 = "Class Info, Schedule, pricing and FAQs"
    @page_description = "Learn more about our mission to enhance English speaking skills for non-native speakers."
  end

  def sample_materials
    @header_3 = "Sample Class Materials... Coming Soon!"
    @page_description = "Explore the materials we use to help you master English speaking skills."
  end
end

private
  # Not used
  def set_headers
    @header ="ESL with Ramona"
    @header_2 = "Master English Speaking Skills"
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :first_language, :subject, :message)
end
