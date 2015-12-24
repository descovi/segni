Rails.application.routes.draw do
  devise_for :users
  
  namespace :great_admin do
    get '/', to: redirect('great_admin/websites')
    resources :websites
    resources :users
  end

  namespace :admin do
    get '/', to: redirect("#{I18n.locale}/admin")
  end

  constraints subdomain: /.+/ do
    scope "/:locale" do
      resources :products, only: [:show]
      resources :pages, only: [:show]
      resource :shopping_cart
      
      namespace :admin do
        get '/' => 'dashboard#home'
        resources :pages
        resources :products
        resources :simple_blocks do
          put :sort
        end
        resources :websites, only: [:update]
      end

    end
  end

  get 'express_checkout', to: 'orders#express_checkout'
  get 'express_checkout_confirm', to: 'orders#express_checkout_confirm'
  resources :orders, only: [:new, :create, :show]  
  root 'welcome#hi'
end
