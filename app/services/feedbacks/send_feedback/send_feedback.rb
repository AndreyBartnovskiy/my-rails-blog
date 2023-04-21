require "dry-monads"

module Feedbacks
  class SendFeedback
    include Dry::Monads[:result]

    def call(args)
      failure_message = "Sorry, try again later"

      return fail!(failure_message) if Feeback.count.zero?

      Feedback.create!(args)

      Success()
    end

    private

    def fail!(message)
      Failure[:feedback_error, message: message]
    end
  end
end
