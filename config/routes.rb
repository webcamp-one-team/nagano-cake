Rails.application.routes.draw do



  devise_for :admins


  


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


  #会員側のルーティング#

  devise_for :members

  get 'home/top' => 'home/top',as: 'member_top'
  get 'home/about' => 'home/about',as: 'member_about'


  	resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  	resources :items, only: [:index, :show]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
