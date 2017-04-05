Rails.application.routes.draw do
  root "teams#index"
  devise_for :users

  resources :teams do
    resources :projects
    member do
      post :join
      post :quit
    end
  end

  namespace :account do
    resources :teams
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
