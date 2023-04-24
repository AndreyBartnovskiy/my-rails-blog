# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def send_feedback_to_admin
    feedback = FactoryBot.build(:feedback)

    AdminMailer.send_feedback_to_admin(feedback)
  end
end
