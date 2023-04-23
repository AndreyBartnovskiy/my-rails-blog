require "dry/transaction"

module Feedbacks
  class ContactToAdmin
    include Dry::Transaction

    step :create_feedback
    step :send_feedback_to_admin

    private

    def create_feedback(feedback_params)
      ContactToAdmin::Save.new.call(feedback_params)
    end

    def send_feedback_to_admin(feedback)
      ContactToAdmin::SendNotification.new.call(feedback)
    end
  end
end
