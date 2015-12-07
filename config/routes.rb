Rails.application.routes.draw do
  devise_for :users
  
  namespace :great_admin do
    resources :websites
    resources :users
  end

  scope "/:locale" do
    resources :operas, only: [:show]
    resources :pages, only: [:show]

    
    namespace :admin do
      resources :pages
      resources :operas
    end

  end
  
  root 'welcome#hi'
end
