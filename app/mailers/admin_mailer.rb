class AdminMailer < ApplicationMailer
  default to: -> { User.where(role: "admin").pluck(:email) },
          from: "from@example.com"

  def send_feedback_to_admin(feedback)
    @feedback = feedback
    mail(subject: "Feedback to Admin")
  end
end
