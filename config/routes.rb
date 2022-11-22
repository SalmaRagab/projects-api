Rails.application.routes.draw do
  resources :projects, only: [:index, :create, :update] do
    member do
      put "assign_participants" => "projects#assign_participants"
    end
  end
end