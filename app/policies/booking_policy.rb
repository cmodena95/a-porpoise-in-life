class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.present? && record.porpoise.user != user
    # ^ user is unable to book their own porpoise
  end

  def show?
    return true
  end

  def update?
    user == record.porpoise.user && record.is_updatable?
  end

  def destroy?
    record.is_updatable?
  end
end
