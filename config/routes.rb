Rails.application.routes.draw do
  resources :pets, only: [:new, :create, :show]
end
