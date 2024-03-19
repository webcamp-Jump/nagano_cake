Rails.application.routes.draw do

  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about', as: 'about'
  # 退会処理
  get '/customers/unsubscribe', to: 'public/customers#unsubscribe', as: 'public_customers_unsubscribe'
  patch '/customers/withdraw', to: 'public/customers#withdraw'

  get '/admin', to: 'admin/homes#top', as: 'admin_root'
  get 'customers/my_page', to: 'public/customers#show', as: 'public_customers'
  get 'customers/information/edit', to: 'public/customers#edit', as: 'public_customers_information_edit'


  get 'public/addresses', to: 'public/addresses#index', as: 'addresses'
  get 'public/addresses/:id/edit', to: 'public/addresses#edit', as: 'addresses_edit'
  get 'public/orders/new', to: 'orders#new', as: 'orders_new'
  patch 'public/addresses/:id', to: 'public/addresses#update'

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  post '/customers/sign_in', to: 'public/sessions#create'

  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
    resources :items, except: [:destroy]
  end

  namespace :admin do
    resources :order_details, only: [:update]
    resources :orders, only: [:index, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update, :show]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
    resources :homes, only: [:top]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
