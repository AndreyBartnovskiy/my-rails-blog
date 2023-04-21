require "dry/monads"

module Feedbacks
  module SendFeedback
    class Action
      include Dry::Monads[:do, :result]

      def call(_request)
        # fmap
        yield create_feedback.call(res.to_h)
        yield send_feedback_to_admin.call

        Success(status: :sent)
        # Success(AdminMailer.send_feedback_to_admin(feedback).deliver)
      end

      private

      attr_reader :create_feedback, :send_feedback_to_admin

      def initialize
        @create_feedback = CreateFeedback.new
        @send_feedback_to_admin = SendFeedbackToAdmin.new
      end
    end
  end
end

#  class SendFeedbackToAdmin
#   include Interactor

#   def call
#     AdminMailer.send_feedback_to_admin(feedback).deliver
#   end
# end
