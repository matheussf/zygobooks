# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Book

    if user.present?
      if user.admin?
        can :create, Book
        can :update, Book
        can :destroy, Book
      end
    end
  end
end
