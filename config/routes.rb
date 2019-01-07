Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show, :make_admin, :remove_admin]

  match '/users',                 to: 'users#index',        via: 'get'
  match '/users/:id',             to: 'users#show',         via: 'get'
  match '/users/:id/make_admin',  to:'users#make_admin',   via: 'get', as: 'make_admin'
  match '/users/:id/remove_admin', to:'users#remove_admin', via: 'get', as: 'remove_admin'

  root to: 'static_pages#home'

  resources :neighborhoods do
    resources :lands, only: [:index, :new]
  end

  resources :lands do

  end
end
