class FeedbacksController < ApplicationController
  before_action -> { authorize! @feedback, with: FeedbackPolicy }

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])

    if @feedback.save
      AdminMailer.feedback_email(@feedback).deliver
      render :thanks
    else
      render :new
    end
  end
  # redirect_to new_feedback_path, notice: "You can leave feedback to the admin"
  # Create a new feedback with mailer

  def thanks
  end
end
