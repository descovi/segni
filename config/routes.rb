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
    put 'opera_set_space_horizontal/:id' => "operas#set_space_horizontal"
    put 'opera_set_space_vertical/:id' => "operas#set_space_vertical"
    put 'opera_set_pos_vertical/:id' => "operas#set_pos_vertical"
  end

  scope "/:locale" do
    resource  :shopping_cart do
      post 'up/:product_id' => 'shopping_carts#up'
      post 'down/:product_id' => 'shopping_carts#down'
    end
  end
  
  scope "/:locale" do
    resources :products, only: [:show]
    resources :operas, only: [:show] do
      collection do
        get 'tag/:tag' => 'operas#tag'
      end
    end
    resources :pages, only: [:show]
    
    namespace :admin do
      get '/' => 'dashboard#home'
      resources :pages do
        post 'first_page' # 'pages#first_page'
      end
      resources :products
      resources :menus do
        put :sort
      end
      resources :operas
      resources :websites
      resources :simple_blocks do
        put :sort
      end
    end
  end

  resources :images

  get 'express_checkout', to: 'orders#express_checkout'
  get 'express_checkout_confirm', to: 'orders#express_checkout_confirm'
  resources :orders, only: [:new, :create, :show]  
  root 'welcome#hi'
end
