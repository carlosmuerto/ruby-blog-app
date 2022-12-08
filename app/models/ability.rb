# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user.present? # logged in users
		can :read, [Post, User, Comment]
    can %i[update destroy create], [Post, Comment], user: user # rubocop:disable Style/HashSyntax

    return unless user.admin? # additional permissions for administrators

    can :destroy, Post
  end
end
