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
      @create_feedback = ContactToAdmin::Save.new
      @send_feedback_to_admin = ContactToAdmin::SendNotification.new
    end
  end
end
