# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :questionnaire_disc, only: %i[index create show]
end
