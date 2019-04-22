Rails.application.routes.draw do

  resources :features
  resources :location_perks
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show, :make_admin, :remove_admin] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end

  match '/users',                 to: 'users#index',        via: 'get'
  match '/users/:id',             to: 'users#show',         via: 'get'
  match '/users/:id/make_admin',  to:'users#make_admin',   via: 'get', as: 'make_admin'
  match '/users/:id/remove_admin', to:'users#remove_admin', via: 'get', as: 'remove_admin'
  match '/users/:id/edit', to: 'users#edit', via: 'get', as: 'edit'

  match 'neighborhoods/:id/edit/delete_image/:attachment_id', to:'neighborhoods#delete_image', via: 'get', as: 'delete_neighborhood_image'
  match 'lands/:id/edit/delete_image/:attachment_id', to:'lands#delete_image', via: 'get', as: 'delete_land_image'

  root to: 'lands#index'

  resources :neighborhoods do
    resources :lands, only: [:index, :new]
  end

  resources :lands do
  end

  resources :land_types do
    resources :lands, only: [:index, :new]
  end

  resources :nearby_locations do
  end

  get 'other_lots', action: :other_lots, controller: 'lands'

  resources :contact_forms do
  end

end
