class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :group
      can :manage, User
      can :manage, :student
      can :manage, :teacher
    end

    if user.has_role? :teacher
      can :read, :group
      can :manage, Activity
    end
  end
end
