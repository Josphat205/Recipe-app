# frozen_string_literal: true

class UserRecipesController < ApplicationController
  def index
    @user_recipes = UserRecipe.created_by_current_user(current_user)
  end

  def show
    @user_recipe = UserRecipe.find(params[:id])
  end

  def new
    @user_recipe = UserRecipe.new
  end

  def create
    @user = current_user
    @user_recipe = UserRecipe.new(user_recipe_params)
    @user_recipe.user = @user
    if @user_recipe.save
      redirect_to user_recipes_path, notice: 'Recipe was successfully created'
    else
      render :new, alert: 'Recipe was not successfully created'
    end
  end

  def destroy
    @user_recipe = UserRecipe.find(params[:id])
    authorize! :destroy, @user_recipe
    @user_recipe.destroy
    redirect_to user_recipes_path, notice: 'Recipe was successfully deleted'
  end

  def public_recipes
    @user_recipes = UserRecipe.public_recipes_ordered_by_newest
  end

  private

  def user_recipe_params
    params.require(:user_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
