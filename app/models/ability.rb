# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new   # ログインしていない場合は、からユーザーを用意し判定に用いる

    if user.admin?
      can :manage, :User
    else
      can [:edit, :update], :User
    end
  end
end
