class SessionPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def show?
    user.present?
  end

  def new?
    create?
  end

  def create?
    user.blank?
  end

  def destroy?
    show?
  end

  def edit?
    show?
  end

  def update?
    show?
  end
end
