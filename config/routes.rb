Rails.application.routes.draw do

  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about', as: 'about'
  get '/', to: 'admin/homes#top', as: 'admin_root'
  get 'customers/my_page', to: 'public/customers#show', as: 'public_customers'
  get 'customers/information/edit', to: 'public/customers#edit', as: 'public_customers_information_edit'
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }


 namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
    resources :items, only: [:index, :show]
  end

  namespace :admin do
    resources :order_details, only: [:update]
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
    resources :homes, only: [:top]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
