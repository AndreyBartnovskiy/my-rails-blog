# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  def contact_email
    AdminMailer.contact_email(contact)
  end
end
