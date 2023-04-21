class FeedbacksController < ApplicationController
  before_action -> { authorize! @feedback, with: FeedbackPolicy }

  def new
    @feedback = Feedback.new
  end

  def create
    result = Feedbacks::Action.new.call(params)

    if result.success?
      flash.now[:notice] = "Feedback sent successfully"
      render :thanks
    else
      flash.now[:alert] = result.failure[:message]
      render :new
    end
  end

  def thanks
  end
end
