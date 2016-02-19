Rails.application.routes.draw do
  devise_for :users
  root "pets#new"
  resources :pets, only: [:new, :create, :show]
end
