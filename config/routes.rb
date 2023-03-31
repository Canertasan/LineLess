# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :tables
  devise_for :users

  get '/qr_code', to: 'home#qr_code'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
