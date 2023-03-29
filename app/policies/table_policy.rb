class TablePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    table_account_owner?
  end

  def destroy?
    table_account_owner?
  end

  private

  def table_account_owner?
    record.account == user
  end

  class Scope < Scope
    def resolve
      scope.where(account: user)
    end
  end
end
