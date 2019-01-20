class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, Group
      can :manage, User
      can :manage, :student
      can :manage, :teacher
    end

    if user.has_role? :teacher
      can :read, Group
      can :manage, Activity
    end
  end
end
