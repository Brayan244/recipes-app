# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home', to: 'pages#home'

  resources :recipes

  get '/signup', to: 'chefs#new'
  resources :chefs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
