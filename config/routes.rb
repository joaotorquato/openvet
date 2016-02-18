Rails.application.routes.draw do
  root "pets#new"
  resources :pets, only: [:new, :create, :show]
end
