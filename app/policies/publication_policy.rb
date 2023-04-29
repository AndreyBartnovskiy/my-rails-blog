class PublicationPolicy < ApplicationPolicy
  authorize :user

  def create?
    owner? || admin?
  end

  def destroy?
    owner? || admin?
  end

  private

  def admin?
    user&.role&.admin?
  end

  def owner?
    user.present? && record.user_id == user.id
  end
end
