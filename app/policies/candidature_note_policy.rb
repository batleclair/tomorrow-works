class CandidatureNotePolicy < ApplicationPolicy
  def update?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  # NOTE: Be explicit about which records you allow access to!
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
