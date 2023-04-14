class ContactMailer < ApplicationMailer
  default to: -> { User.where(role: "admin").pluck(:email) },
          from: "from@example.com"

  def contact_email
    mail(subject: "Feedback to Admin")
  end
end
