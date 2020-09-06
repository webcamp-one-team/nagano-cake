Rails.application.routes.draw do




 #会員側のルーティング#

  scope module: :members do
    devise_for :members

    get 'home/top' => 'home/top',as: 'member_top'
    get 'home/about' => 'home/about',as: 'member_about'
    get "members/my_page" => "members#show"
    get "members/unsubscribe" => "members#unsubscribe"
    get "members/withdraw" => "members#withdraw"

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :members, only: [:edit, :update, :show]
    resources :carts, only: [:index, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :genres, only: [:show]
    resources :orders, only: [:index, :new, :create, :show]
      post 'order/confirm' => 'orders#confirm', as: 'order_confirm'
      get "order/thanks" => 'orders#thanks', as: 'order_thanks'
  end


  #管理者側のルーティング
   #scope module: :admins do
  #devise_for :admins
   #end
  namespace :admins do

    get '' => 'tops#top'
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
    resources :items, only: [:index, :show, :edit, :update, :create, :new]
    resources :genres, only: [:index, :edit, :update, :create]
    resources :members, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
