class FeedbacksController < ApplicationController
  before_action -> { authorize! Feedback }

  def new
    @feedback = Feedback.new
  end

  def create
    result = action

    @feedback = result.either(->(_feedback) { result.value! }, ->(_feedback) { result.failure })

    if result.success?
      flash.now[:notice] = "Feedback sent successfully"
      render :thanks
    else
      flash.now[:alert] = "Something went wrong"
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :name, :message)
  end

  def action
    Feedbacks::Action.new.call(feedback_params)
  end
end
