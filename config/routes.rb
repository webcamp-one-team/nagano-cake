Rails.application.routes.draw do

#会員側のルーティング
  devise_for :members
  namespace :members do
    get 'home/top' => 'home#top',as: 'member_top'
    get 'home/about' => 'home#about',as: 'member_about'
    get "members/my_page" => "members#show"
    get "members/unsubscribe" => "members#unsubscribe"
    get "members/withdraw" => "members#withdraw"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :members, only: [:edit, :update, :show]
    resources :items, only: [:index, :show]
    resources :genres, only: [:show]
  end

  #管理者側のルーティング
  devise_for :admins
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
