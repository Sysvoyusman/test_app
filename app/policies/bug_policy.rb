class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #here add all the restrictions that you wanted to add in that method

      scope.all
    end
  end


  
  #attr_reader :user, :bug
  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  #def initalize(current_user)
   # @current_user = current_user
  #end


  def index?
    #if Developer_bug_view?
     # true
    #end
    true
  end
  def destroy? 
    #its its false then there is no error + the bug doesnt get destroyed
    #if its true , it gets destroyed and also gives and error
    if is_Admin?  
      true
    end
  end

  def new?
    #check if its admin
    if is_Admin_or_QA?  
      true
    end 
  end
  
  def create?
    true
  end

  def edit?                   #edit Bug will go here
    #debugger
    if is_Admin_or_QA?  
      true
    end 
  end

  def show?
    true
  end

  def update?
    #debugger
    true
  end


  def editstatus? 
    true
  end
  #simple methods
  def is_Admin_or_QA?
    if (user.role == "Admin" || user.role == "QA")
      true
    else 
      false
    end 
  end
  
  def is_Admin?
    if (user.role == "Admin" )
      true
    else 
      false
    end 
  end
  
  def Admin_bug_view?
    if (user.role == "Admin" )    #will be used in Bugs views
      true
    else 
      false
    end 
  end

  def QA_bug_view?
    if (user.role == "QA" )       #will be used in Bugs views
      true
    else 
      false
    end 
  end

  def Developer_bug_view?
    if (user.role == "Developer" )  #will be used in Bugs views
      true
    else 
      false
    end 
  end

  #its of no use
  def change_to_resolve
    #bug.status = "Resolved"
    #user.role is accessible becuase of the session variable 
  end
end
