class DealPolicy < ApplicationPolicy
  def owner?
    user.deal_owner?(record)
  end

  def publish?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        return scope.where(published: !@pending) if @pending.present?
        scope.all
      else
        scope.where(published: true, private: false)
      end
    end
  end
end
