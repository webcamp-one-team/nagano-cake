Rails.application.routes.draw do
  namespace :admins do
    get '' => 'tops#top'
  end
  namespace :admins do
    resources :orders, only: [:index, :show, :update]
  end
  namespace :admins do
    resources :order_items, only: [:update]
  end
  namespace :admins do
    resources :items, only: [:index, :show, :edit, :update, :create, :new]
  end
  namespace :admins do
    resources :genres, only: [:index, :edit, :update, :create]
  end
  namespace :admins do
    resources :members, only: [:index, :show, :edit, :update]
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
