Rails.application.routes.draw do
  # deviseユーザー用
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # ユーザー用
  root "homes#top"
  get "about" => "homes#about"
  get '/search', to: 'searches#search'
  
  scope module: :public do
    resources :posts
    resources :users
      get   "unsubscribe"        => "users#unsubscribe"
      patch "withdraw"           => "users#withdraw"
    get :mypage, to: 'users#mypage'  
  end

  # devise管理者用
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  # 管理者用
  scope module: :admin do
    resources :posts
    resources :users
    resources :dashboards, only: [:index]
  end
  
end