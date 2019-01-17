Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show, :make_admin, :remove_admin]

  match '/users',                 to: 'users#index',        via: 'get'
  match '/users/:id',             to: 'users#show',         via: 'get'
  match '/users/:id/make_admin',  to:'users#make_admin',   via: 'get', as: 'make_admin'
  match '/users/:id/remove_admin', to:'users#remove_admin', via: 'get', as: 'remove_admin'
  match 'neighborhoods/:id/edit/delete_image/:attachment_id', to:'neighborhoods#delete_image', via: 'get', as: 'delete_neighborhood_image'
  match 'lands/:id/edit/delete_image/:attachment_id', to:'lands#delete_image', via: 'get', as: 'delete_land_image'

  root to: 'static_pages#home'

  resources :neighborhoods do
    resources :lands, only: [:index, :new]
  end

  resources :lands do

  end
end
