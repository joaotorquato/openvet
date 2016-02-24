Rails.application.routes.draw do
  devise_for :users
  root "pets#index"
  resources :pets, only: [:new, :create, :show, :index]
  resources :vaccinations, only: [:new, :create, :show]
end
