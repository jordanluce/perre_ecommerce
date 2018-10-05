Rails.application.routes.draw do
  get '/admin_login' => 'admin/sessions#new'
  get '/admin_logout' => 'admin/sessions#destroy'
  
  namespace :admin do
    root to: 'products#index'
    resources :products
    resources :sessions, only: [:new, :create, :destroy]
    resources :sizes, except: [:show, :new]
  end
end
