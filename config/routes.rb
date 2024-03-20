Rails.application.routes.draw do
  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about', as: 'about'
  # 退会処理
  get '/customers/unsubscribe', to: 'public/customers#unsubscribe', as: 'public_customers_unsubscribe'
  patch '/customers/withdraw', to: 'public/customers#withdraw'
  
  get '/admin', to: 'admin/homes#top', as: 'admin_root'
  get 'customers/my_page', to: 'public/customers#show', as: 'public_customers'
  get 'customers/information/edit', to: 'public/customers#edit', as: 'public_customers_information_edit'
  
  get 'addresses', to: 'public/addresses#index', as: 'addresses'
  get 'addresses/:id/edit', to: 'public/addresses#edit', as: 'addresses_edit'
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
    resources :addresses, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :create] do
        post 'confirm', on: :collection
        get 'thanks', on: :collection
    end

    resources :cart_items, only: [:index, :update, :destroy, :create, :show] do
      delete :destroy_all, on: :collection
    end
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
    resources :items, except: [:destroy]
    # 修正した部分
    delete 'cart_items', to: 'cart_items#destroy_all'
  end
  # Move public/cart_items route definition outside of public namespace
  resources :cart_items, only: [:index, :update, :destroy, :create] do
    delete :destroy_all, on: :collection
  end

  namespace :admin do
    resources :order_details, only: [:update]
    resources :orders, only: [:index, :show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update, :show]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
    resources :homes, only: [:top]
  end
end
