class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.persisted?
      can :manage, Client, user_id: user.id
    else
      cannot :read, :all
    end
  end
end
