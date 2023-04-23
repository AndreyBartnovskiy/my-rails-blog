require "dry-monads"

module Feedbacks
  class ContactToAdmin
    class Save
      include Dry::Monads[:result]

      def call(feedback_params)
        feedback = Feedback.new(feedback_params)

        feedback.save ? Success(feedback) : Failure(feedback)
      end
    end
  end
end
