Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      "admin/sessions",
    passwords:     "admin/passwords",
    registrations: "admin/registrations"
}

  devise_for :users, controllers: {
    sessions:      "users/sessions",
    passwords:     "users/passwords",
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
    root to: 'users#index'
    resources :users, except: [:new, :create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
