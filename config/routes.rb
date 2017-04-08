Rails.application.routes.draw do
  root "teams#index"
  devise_for :users

  resources :teams do
    resources :projects do
      resources :todos do
        get :finish
        get :unfinish
      end
    end

    member do
      post :join
      post :quit
    end
  end

  namespace :account do
    resources :teams
    resources :projects
    resources :todos
    resources :events
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
