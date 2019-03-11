class MoviePolicy < ApplicationPolicy
  def create?
    user.role.admin?
  end
end
