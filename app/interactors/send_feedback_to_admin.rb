class SendFeedbackToAdmin
  include Interactor

  def call
    AdminMailer.send_feedback_to_admin(feedback).deliver
  end
end

# переделаю в фидбэк, добавлю таблицу, поменяю мэйлер, контакт в фидбэк.
