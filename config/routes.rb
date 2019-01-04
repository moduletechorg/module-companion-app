Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'

  resources :neighborhoods do
    resources :lands, only: [:index, :new]
  end

  resources :lands do

  end
end
