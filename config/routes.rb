Rails.application.routes.draw do
  devise_for :users
  root "pets#index"
  resources :pets, only: [:new, :create, :show, :index] do
    resources :vaccinations, only: [:new, :create, :show]
  end
end
