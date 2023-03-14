# frozen_string_literal: true

class User < ApplicationRecord
  has_many :foods
  has_many :user_recipes
end
