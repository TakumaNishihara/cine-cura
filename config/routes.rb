Rails.application.routes.draw do
# ユーザー用
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  root "homes#top"
  get "about" => "homes#about"
end