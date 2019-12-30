# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :home, only: %i[index]
  get 'home/disc_history', to: 'home#disc_history'
  get 'home/disc_perfis', to: 'home#disc_perfis'
  resources :questionnaire_disc, only: %i[index create show]
end
