require "dry-monads"

module Feedbacks
  module SendFeedback
    class CreateFeedback
      include Dry::Monads[:result]

      def call(_params)
        feedback = Feedback.new(feedback_params)

        if feedback.valid?
          Success(feedback)
        else
          Failure(feedback.errors.full_messages.join(", "))
        end
      end

      private

      def feedback_params
        params.require(:feedback).permit(:email, :message, :name)
      end
    end
  end
end
