# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new   # ログインしていない場合は、からユーザーを用意し判定に用いる

    if user.admin?
      can :manage, :all
    else
      can :manege, User
      cannot [:new, :create, :destroy], :User
    end
  end
end
