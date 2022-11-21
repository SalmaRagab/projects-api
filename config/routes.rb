Rails.application.routes.draw do
  resources :projects, only: [:index, :create, :update]
end