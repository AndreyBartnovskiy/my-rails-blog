class FeedbacksController < ApplicationController
  before_action -> { authorize! @feedback, with: FeedbackPolicy }

  def new
    @feedback = Feedback.new
  end

  def create
    call_action(send_feedback)
  end

  def thanks
  end

  private

  def send_feedback
    Feedbacks::SendFeedback::Action.new
  end
end

# #     @feedback = Feedback.new(feedback_params)
# def create
# if @feedback.save
#   AdminMailer.send_feedback_to_admin(@feedback).deliver
#   render :thanks
# else
#   render :new
# end
