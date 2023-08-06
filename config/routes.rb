Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'api/v1/recipes', to: 'recipes#index'
  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index]
    end
  end
end
