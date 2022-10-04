# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :boards do
    resources :lists do
      resources :tasks
    end
  end
  resources :labels
  resources :tags
  resources :plans
  root 'pages#home'
end
