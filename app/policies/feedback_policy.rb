class FeedbackPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def create?
    true
  end

  def new?
    create?
  end

  def thanks?
    true
  end
end
