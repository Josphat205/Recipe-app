class RecipeFood < ApplicationRecord
  belongs_to :user_recipe
  belongs_to :food
end
