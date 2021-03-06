Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :pets, only: [:new, :create, :show, :index] do
    resources :vaccinations, only: [:create]
  end
end
