class ArticlePolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  relation_scope do |relation|
    if user.nil?
      relation.published
    else
      relation.where(user_id: user.id).or(relation.published)
    end
  end

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
    true
  end

  def destroy?
    owner?
  end

  def edit?
    update?
  end

  def update?
    owner?
  end

  private

  def owner?
    user.present? && record.user == user
  end
end