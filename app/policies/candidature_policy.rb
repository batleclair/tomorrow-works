class CandidaturePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    !Candidate.find_by(user: user).nil?
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  def accepted?
    true
  end

  def refused?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
