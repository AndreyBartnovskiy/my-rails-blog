require "dry-monads"

module Feedbacks
  module SendFeedback
    class CreateFeedback
      include Dry::Monads[:result]

      def call(feedback_params)
        feedback = Feedback.new(feedback_params)

        if feedback.valid?
          Success(feedback)
        else
          Failure(feedback.errors.full_messages.join(", "))
        end
      end
    end
  end
end
