# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :boards
  resources :plans
  resources :lists
  root 'pages#home'
end
