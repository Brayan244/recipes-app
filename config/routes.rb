# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home', to: 'pages#home'

  resources :recipes

  get '/signup', to: 'chefs#new'
  resources :chefs

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :ingredients, except: [:destroy]
end
