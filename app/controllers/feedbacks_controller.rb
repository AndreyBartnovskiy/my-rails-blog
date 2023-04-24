class FeedbacksController < ApplicationController
  before_action -> { authorize! Feedback }

  def new
    @feedback = Feedback.new
  end

  def create
    if result.success?
      flash.now[:notice] = "Feedback sent successfully"
      render :thanks
    else
      @feedback = result.failure
      flash.now[:alert] = "Something went wrong"
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :name, :message)
  end

  def result
    @result ||= Feedbacks::ContactToAdmin.new.call(feedback_params)
  end
end
