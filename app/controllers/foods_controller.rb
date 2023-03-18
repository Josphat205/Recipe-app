# frozen_string_literal: true

class FoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @foods = Food.all
  end

  def new
    @user = current_user
    @food = Food.new
  end

  def create
    @user = current_user
    @food = Food.new(food_params)
    @food.user = @user
    if @food.save
      redirect_to root_path, notice: 'Food was successfully created.'
    else
      render :new, alert: 'Food was not created.'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to root_path, notice: 'Food was successfully deleted.'
  end

  def food_params
    params.permit(:name, :measurement_unit, :price, :quantity, current_user.id)
  end
end
