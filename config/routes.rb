Rails.application.routes.draw do
  devise_for :users
  
  namespace :great_admin do
    resources :websites
    resources :users
  end

  scope "/:locale" do
    resources :operas
    resources :pages

    root 'websites#show'
    
    namespace :admin do
      resources :pages
      resources :opera
    end

  end
  
end
