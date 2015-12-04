Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :operas
  resources :websites
  resources :pages
  root 'websites#show'
end
