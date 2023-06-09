# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
end
