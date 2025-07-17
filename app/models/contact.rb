class Contact < ApplicationRecord
  validates :first_name, :subject, :message, :first_language, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
