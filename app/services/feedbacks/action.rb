require "dry-monads"

module Feedbacks
  class Action
    include Dry::Monads[:do, :result]

    def call(feedback_params)
      feedback = yield create_feedback.call(feedback_params)
      yield send_feedback_to_admin.call(feedback)

      Success()
    end

    private

    attr_reader :create_feedback, :send_feedback_to_admin

    def initialize
      @create_feedback = SendFeedback::CreateFeedback.new
      @send_feedback_to_admin = SendFeedback::SendFeedbackToAdmin.new
    end
  end
end
