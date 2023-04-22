require "dry-monads"

module Feedbacks
  module ContactToAdmin
    class Save
      include Dry::Monads[:result]

      def call(feedback_params)
        feedback = Feedback.new(feedback_params)

        feedback.save ? Success(feedback) : Failure(feedback)
      end

      private

      def feedback
        @feedback ||= Feedback.new(feedback_params)
      end
    end
  end
end
