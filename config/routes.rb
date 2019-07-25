Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :requests, only: [:create]
  resources :users, only: [:create] do
    resources :companies, only: [:create]
  end
end
