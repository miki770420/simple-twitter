Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  # 請依照專案指定規格來設定路由

  resources :tweets, only: [:index, :create] do
    resources :replies, only: [:index, :create]
    member do
      post 'like'
      post 'unlike'
    end
  end

  resources :users, only: [:edit, :update] do
    member do
      get 'tweets'
      get 'followers'
      get 'followings'
      get 'likes'
    end
  end

  resources :followships, only: [:create, :destroy]


  root "tweets#index"

  namespace :admin do
    resources :tweets, only: [:index, :destroy]
    resources :users, only: [:index]
    root "tweets#index"
  end
end
