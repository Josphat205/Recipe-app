# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'devise/sessions',registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: %i[create destroy]
  resources :user_recipes, only: [:create, :index, :show, :destroy, :update] do
    resources :recipe_foods
  end
  resources :public_recipes, only: [:index]
  resources :shopping_list, only: [:index]
  # Defines the root path route ("/")
  root 'foods#index'
end
