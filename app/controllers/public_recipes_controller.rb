# frozen_string_literal: true

class PublicRecipesController < ApplicationController
  def index
    @recipes = UserRecipe.where(public: true).order(created_at: :desc)
  end
end
