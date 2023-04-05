class PublicationPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def create?
    owner?
  end

  def destroy?
    owner?
  end
end
