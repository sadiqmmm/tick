Rails.application.routes.draw do
  
  namespace :admin do
    root to: "application#index"

    resources :users
    resources :projects, only: [:new, :create, :destroy]
  end

  devise_for :users

  resources :projects, only: [:index, :show, :edit, :update] do 
    resources :tickets
  end

  root to: "projects#index"
end
