# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'recruits', to: 'recruit#index'
  get 'recruits/:id', to: 'recruit#show'
  get 'characters', to: 'character#show'
  post 'characters', to: 'character#create'
end
