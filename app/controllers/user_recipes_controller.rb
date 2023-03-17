# frozen_string_literal: true

class UserRecipesController < ApplicationController
  load_and_authorize_resource
  def new
    @recipe = UserRecipe.new
  end

  def create
    @user = current_user
    @recipe = @user.user_recipes.new(recipes_params)
    @recipe.public = false
    if @recipe.save
      redirect_to user_recipes_path, notice: 'recipe was successfully created'
    else
      render :new, alert: "Couldn't create recipe for user"
    end
  end

  def index
    @recipes = UserRecipe.all
  end

  def show
    @recipe = UserRecipe.find(params[:id])
    @user = current_user
    @recipe_foods = RecipeFood.includes(:food).where(user_recipe_id: @recipe.id)
  end

  def destroy
    @recipe = UserRecipe.find(params[:id])
    @recipe.destroy
    redirect_to user_recipes_path, notice: 'Recipe was successfully deleted'
  end

  def update
    @recipe = UserRecipe.find(params[:id])

    if @recipe.public == true
      @recipe.update(public: false)
    else
      UserRecipe.find(@recipe.id).update(public: true)
    end
    redirect_to user_recipe_path(@recipe.id), notice: 'Public Updated'
  end

  private

  def recipes_params
    params.permit(:name, :description, :preparation_time, :cooking_time, current_user.id)
  end
end
