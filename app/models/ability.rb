class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.normal?
      can :manage, Client, user_id: user.id
      can [:show, :update], User, id: user.id
    else
      cannot :read, :all
    end
  end
end
