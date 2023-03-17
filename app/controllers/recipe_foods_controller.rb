# frozen_string_literal: true

class RecipeFoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @foods = current_user.recipes_foods.select(:food_id, 'SUM(quantity) as quantity').group(:food_id, :quantity)
    @sum = 0
    @foods.each do |food|
      @sum += food.quantity * food.food.price
    end
  end

  def create
    @user = current_user
    @recipe = UserRecipe.find(params[:user_recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipes_foods_params)
    if @recipe_food.save
      redirect_to user_recipe_path(params[:user_recipe_id]), notice: 'Food was successfully added'
    else
      render :new, alert: "Couldn't add food to recipe"
    end
  end

  def new
    @foods = Food.all
    @food_items = []
    @foods.each do |food|
      @food_items << [food.name, food.id]
    end
    @recipe = UserRecipe.find(params[:user_recipe_id])
  end

  def destroy
    @user = current_user
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    return unless @recipe_food.destroy

    redirect_to user_recipe_path(params[:user_recipe_id]), notice: 'Food was successfully deleted'
  end

  # Only allow a list of trusted parameters through.
  def recipes_foods_params
    params.require(:@recipe_food).permit(:food_id, :user_recipe_id, :quantity)
  end
end
