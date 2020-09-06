Rails.application.routes.draw do

#会員側のルーティング#
  scope module: :members do

    get 'home/top' => 'home/top',as: 'member_top'
    get 'home/about' => 'home/about',as: 'member_about'
    get "members/my_page" => "members#show"
    get "members/unsubscribe" => "members#unsubscribe", as: "member_unsubscribe"
    patch "members/withdraw" => "members#withdraw", as: "member_withdraw"
    resource :addresses, only: [:index, :edit, :create, :update, :destroy]

    resource :member, only: [:edit, :update, :show]

    resources :items, only: [:index, :show]

    resources :genres, only: [:show]
  end
devise_for :members
#↑devise_for :membersは当初2行目上に置いてあったが下に置かれることになった。
#理由としては上から順に読み込まれていった結果「resource :member, only: [:edit, :update, :show]」を読み
#「edit_member_path」に遷移するはずが
#「 edit_member_registration_path」を読み込みdevise側で用意している個人情報編集画面に行くエラーが発生したので下に設置した。オカタク


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

end
