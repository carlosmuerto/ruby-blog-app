class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # logged in users

    can :read, [Post, User, Comment]
    can %i[update destroy create], [Post, Comment, Like], author: user

    return unless user.admin? # additional permissions for administrators

    can %i[create read update destroy], [Post, Comment, Like, User]
  end
end
