require "dry-monads"

module Feedbacks
  module ContactToAdmin
    class SendNotification
      include Dry::Monads[:result]

      def call(feedback)
        AdminMailer.send_feedback_to_admin(feedback).deliver_later
        Success()
      end
    end
  end
end
