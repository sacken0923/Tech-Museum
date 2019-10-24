Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    collection do
      get "search"
    end
    resources :comments, only: [:create]
  end
  resources :users, only: [:edit, :update]
end
