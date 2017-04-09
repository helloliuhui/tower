Rails.application.routes.draw do
  root "teams#index"
  devise_for :users

  resources :teams do
    resources :projects do
      resources :todos do
        get :finish
        get :unfinish
        get :efinisher
        patch :efinisher_update
        get :edeadline
        patch :edeadline_update
        resources :comments
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

  resources :events do
    member do
      post :create
      post :delete
      post :finish
      post :update_finisher
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
