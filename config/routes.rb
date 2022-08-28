Rails.application.routes.draw do

  namespace :admin do
    get 'homes/unsubscribe'
    get 'homes/withdraw'
  end
  #新規登録・ログイン
  namespace :public do
    get 'bookmarks/show'
  end
  devise_for :admins, skip: [:passwords], controllers: {
    sessions:      "admin/sessions",
    registrations: "admin/registrations"
}

  devise_for :users, skip: [:passwords], controllers: {
    sessions:      "users/sessions",
    registrations: "users/registrations"
}

  # ルーティングエラー対策(試し)
  get "admins" => "admins/users#admins"

  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => "homes#about"
    # タグ・投稿の検索結果ページ
    get 'recipes/tag/:name', to: "recipes#tag_search"
    get 'recipes/search', to: 'recipes#search'

    # ユーザの退会確認ページ
    get "unsubscribe/:name" => "homes#unsubscribe", as: "confirm_unsubscribe"
    patch ":id/withdraw/:name" => "homes#withdraw", as: "withdraw_user"
    put "withdraw/:name" => "users#withdraw"

    resources :users, only: [:show, :index, :edit, :update] do
      member do
          get :bookmarks, :comments
      end
    end

    resources :recipes
    resources :recipes do
      resources :comments, only: [:create, :destroy]
      resource :bookmarks, only: [:show, :create, :destroy] do
        get 'recipes/:recipe_id/bookmarks' => 'bookmarks#show', as: 'my_bookmarks'
      end
    end

    resources :notifications, only: [:index]
  end

  namespace :admin do
    root to: 'admin/users#index'
    resources :users, except: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
