class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  attr_reader :user, :bug
  def initialize(user, bug)
    @user = user
    #debugger
    @bug = bug
  end

  #create new not coming to this method...
  def new?
    #debugger
    if !user.nil?
      if(user.role == "Admin") 
        #debugger
        true
      else 
        #debugger
        false
      end
    end
    #true #if nothing worked up
   #if its false nobody can sign up
   #debugger
    #its coming to this method now we just need to 
  end

  def user_exist?
    !current_user.nil?
  end
end
