class FeedbackPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def create?
    !user.present?
  end

  def new?
    create?
  end
end
