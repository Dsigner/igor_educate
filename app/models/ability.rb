class Ability
  # include CanCan::Ability
  # 
  #  def initialize(user)
  #      # Define abilities for the passed in user here.
  #      user ||= User.new # guest user (not logged in)
  #      # a signed-in user can do everything
  #      if user.has_role? :instructor
  #       # an admin can do everything
  #        can :manage, :all
  #      elsif user.has_role? :student
  #        # an editor can do everything to documents and reports
  #        can :manage, []
  #        # but can only read, create and update charts (ie they cannot
  #        # be destroyed or have any other actions from the charts_controller.rb
  #        # executed)
  #        can [:read, :create, :update],
  #        # an student can only view the annual report
  #        can :read, []
  #      elsif user.has_role? :guest
  #        can :read, []
  #      end
  #    end
   end
  