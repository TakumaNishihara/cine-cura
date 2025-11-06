class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:id])
  end

  def edit
  end

  def mypage
  end
end
