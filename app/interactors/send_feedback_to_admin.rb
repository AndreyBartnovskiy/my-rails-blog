class SendFeedbackToAdmin
  include Interactor

  def call
    AdminMailer.contact_email.deliver
  end
end

# переделаю в фидбэк, добавлю таблицу, поменяю мэйлер, контакт в фидбэк.
