# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'character', to: 'character#show'
end
