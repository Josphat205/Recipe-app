Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:create, :destroy]
  resources :user_recipes, only: [:create, :index, :show, :destroy, :update] do
    resources :recipe_foods
  end
  resources :public_recipes, only: [:index]
  resources :shopping_list, only: [:index]
  # Defines the root path route ("/")
  root "foods#index"
end
