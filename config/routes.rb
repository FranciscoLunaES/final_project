# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }

  resources :boards do
    resources :lists do
      resources :tasks
    end
  end

  get '/team', to: 'boards#team'

  resources :labels
  resources :tags
  resources :plans
  root 'pages#home'
end
