# frozen_string_literal: true

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
    table_owner?
  end

  def destroy?
    table_owner?
  end

  private

  def table_owner?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.where(:user)
    end
  end
end
