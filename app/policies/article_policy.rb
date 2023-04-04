class ArticlePolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def show?
    create?
  end
end
