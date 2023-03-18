# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'admin'
      can :manage, :all
    else
      can %i[update destroy], UserRecipe, user_id: user.id
      can %i[destroy], Food, user_id: user.id
      can :create, Food
      can :create, UserRecipe
      can :create, RecipeFood
      can :destroy, RecipeFood
      can :read, :all
    end
  end
end
