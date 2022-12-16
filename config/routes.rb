Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "dashboards#show"
  # get "games/:game_id/parties/:party_id", to: "games#grocery_list", as: :grocery_list
  resources :games, only: %i[show new] do
    resources :parties, only: %i[new create]
  end
end
