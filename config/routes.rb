Rails.application.routes.draw do
  devise_for :users
  
  namespace :great_admin do
    get '/', to: redirect('great_admin/websites')
    resources :websites
    resources :users
  end

  namespace :admin do
    get '/', to: redirect("#{I18n.locale}/admin/pages")
  end

  constraints subdomain: /.+/ do
    scope "/:locale" do
      resources :products, only: [:show]
      resources :pages, only: [:show]

      
      namespace :admin do
        get '/' => 'dashboard#home'
        resources :pages
        resources :products
        resources :simple_blocks
        resources :websites, only: [:update]
      end

    end
  end
  
  root 'welcome#hi'
end
