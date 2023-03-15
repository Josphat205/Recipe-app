# frozen_string_literal: true

class UserRecipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  def self.created_by_current_user(current_user)
    where(user_id: current_user.id).order(created_at: :desc)
  end

  def self.public_recipes_ordered_by_newest
    where(public: true).order(created_at: :desc)
  end
end
