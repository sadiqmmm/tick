Rails.application.routes.draw do
  
  namespace :admin do
    root to: "application#index"

    resources :users do 
      member do 
        patch :archive
        patch :unarchive
      end
    end

    resources :projects, only: [:new, :create, :destroy]
    resources :states, only: [:index, :new, :create]
  end

  devise_for :users

  resources :attachments, only: [:show, :new]

  resources :projects, only: [:index, :show, :edit, :update] do 
    resources :tickets
  end

  resources :tickets, only: [] do
    resources :comments, only: [:create]
  end

  root to: "projects#index"
end
