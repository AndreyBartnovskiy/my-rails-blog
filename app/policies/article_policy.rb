class ArticlePolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  relation_scope do |relation|
    if admin?
      relation.all
    elsif user.present?
      relation.where(user_id: user.id).or(relation.published)
    else
      relation.published
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
    owner? || admin?
  end

  def edit?
    update?
  end

  def update?
    owner? || admin?
  end

  private

  def admin?
    user.present? && user.role == "admin"
  end

  def owner?
    user.present? && record.user_id == user.id
  end
end
