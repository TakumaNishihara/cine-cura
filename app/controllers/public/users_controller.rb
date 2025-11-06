class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:id])
  end

  def edit
  end

  def mypage
    @user = current_user
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
  end
end
