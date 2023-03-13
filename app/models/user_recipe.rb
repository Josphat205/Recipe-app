# frozen_string_literal: true

class UserRecipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
end
