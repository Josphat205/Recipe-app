# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: %i[create destroy]
  resources :user_recipes, only: %i[create index new show destroy] do
    resources :recipe_foods
  end
  resources :public_recipes, only: [:index]
  resources :shopping_list, only: [:index]
  # Defines the root path route ("/")
  root 'foods#index'
end
