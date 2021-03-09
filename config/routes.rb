# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, exept: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :users, only: :create
  get :signup, to: 'users#new'

  resources :sessions, only: :create
  get :login, to: 'sessions#new'

  root to: 'tests#index'
end
