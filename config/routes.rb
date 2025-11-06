Rails.application.routes.draw do

  root "homes#top"
  get "about" => "homes#about"
  
  scope module: :public do
    resources :posts
    resources :users
    get :mypage, to: 'users#mypage'
  end

# deviseユーザー用
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# devise管理者用
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
end