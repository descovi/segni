Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  namespace :great_admin do
    get '/', to: redirect('great_admin/websites')
    resources :websites
    resources :users
  end

  namespace :admin do
    get '/', to: redirect("#{I18n.locale}/admin")
  end

  scope "/:locale" do
    resource  :shopping_cart do
      post 'up/:product_id' => 'shopping_carts#up'
      post 'down/:product_id' => 'shopping_carts#down'
    end
  end

  constraints subdomain: /.+/ do
    scope "/:locale" do
      resources :products, only: [:show]
      resources :operas, only: [:show]
      resources :pages, only: [:show]
      
      namespace :admin do
        get '/' => 'dashboard#home'
        resources :pages do
          post 'first_page' # 'pages#first_page'
        end
        resources :products
        resources :operas
        resources :simple_blocks do
          put :sort
        end
      end
    end
  end

  get 'express_checkout', to: 'orders#express_checkout'
  get 'express_checkout_confirm', to: 'orders#express_checkout_confirm'
  resources :orders, only: [:new, :create, :show]  
  root 'welcome#hi'
end
