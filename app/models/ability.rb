# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, [Book, Category]
    
    if user.has_role?(:admin)
      can :create, Category
      can :update, Category

    end

    if user.has_role?(:author)
      can :create, Book
      can :update, Book do |book|
        book.author == user
      end
    end
  end
end
