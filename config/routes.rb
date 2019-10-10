Rails.application.routes.draw do

  mount Blazer::Engine, at: "blazer"

  resources :features
  resources :location_perks

  devise_for :users, :path_prefix => 'user', controllers: { registrations: "registrations", sessions: "user_sessions" }
  devise_for :admins, :path_prefix => 'admin', controllers: { registrations: "registrations", sessions: "admin_sessions" }
  resources :users, :only =>[:show, :make_admin, :remove_admin] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end

  # User Paths
  match '/users',                 to: 'users#index',        via: 'get'
  match '/users/:id',             to: 'users#show',         via: 'get'
  match '/users/:id/make_admin',  to:'users#make_admin',   via: 'get', as: 'make_admin'
  match '/users/:id/remove_admin', to:'users#remove_admin', via: 'get', as: 'remove_admin'
  match '/users/:id/edit', to: 'users#edit', via: 'get', as: 'edit'

  # Admin Paths
  match '/admins',                 to: 'admins#index',        via: 'get'
  match '/admins/:id',             to: 'admins#show',         via: 'get'
  match '/admins/:id/edit',        to: 'admins#edit', via: 'get'


  match 'neighborhoods/:id/edit/delete_image/:attachment_id', to:'neighborhoods#delete_image', via: 'get', as: 'delete_neighborhood_image'
  match 'lands/:id/edit/delete_image/:attachment_id', to:'lands#delete_image', via: 'get', as: 'delete_land_image'

  root to: "lands#index"

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

  resources :feedbacks do
  end

  resources :models do
  end

  get 'user_land_feedbacks/toggleActive', to: 'user_land_feedbacks#toggleActive'

  resources :saved_lots do
  end

  match 'users/toggleSave/:land_id', to: 'users#toggleSave', via: 'get', as: 'toggleSave'

end
