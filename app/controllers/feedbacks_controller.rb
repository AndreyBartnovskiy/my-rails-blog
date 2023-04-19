class FeedbacksController < ApplicationController
  before_action -> { authorize! @feedback, with: FeedbackPolicy }

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      AdminMailer.send_feedback_to_admin(@feedback).deliver
      render :thanks
    else
      render :new
    end
  end

  def thanks
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :message, :name)
  end
end
