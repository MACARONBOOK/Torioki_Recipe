Rails.application.routes.draw do

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
    get "/search" => "homes#search"

    get "unsubscribe/:name" => "homes#unsubscribe", as: "confirm_unsubscribe"
    patch ":id/withdraw/:name" => "homes#withdraw", as: "withdraw_user"
    put "withdraw/:name" => "users#withdraw"

    resources :users, only: [:show, :index, :edit, :update] do
      member do
          get :following, :followers
      end
    end
    resource :relationships, only: [:create, :destroy]
  end


  namespace :admin do
    root to: 'admin/users#index'
    get '/users/index' => "admin/users#index"
    resources :users, except: [:new, :create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
