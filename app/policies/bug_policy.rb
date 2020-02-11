class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #here add all the restrictions that you wanted to add in that method
      scope.all
    end
  end
end
