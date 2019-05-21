Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :requests, only: [:create]
  resources :users, only: [:create] do
    resources :companies, only: [:create]
  end

  resources :authentication, path: "auth", only: [] do
    collection do
      post :login
      post :logout
    end
  end
end
