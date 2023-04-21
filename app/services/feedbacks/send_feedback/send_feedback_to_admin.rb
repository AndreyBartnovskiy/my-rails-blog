require "dry-monads"

module Feedbacks
  module SendFeedback
    class SendFeedbackToAdmin
      include Dry::Monads[:result]

      def call(feedback)
        AdminMailer.send_feedback_to_admin(feedback).deliver_now
        Success()
      end
    end
  end
end
