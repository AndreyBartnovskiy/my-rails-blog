class Feedback < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :message, :name, presence: true
end
