class AdminMailer < ApplicationMailer
  default to: -> { User.where(role: "admin").pluck(:email) },
          from: "from@example.com"

  def contact_email(contact)
    @contact = contact
    mail(subject: "Feedback to Admin")
  end
end
