class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to mypage_path
  end


  def mypage
    @user = current_user
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user

    if @user.update(is_active: false) 
      reset_session
      redirect_to root_path, notice: "退会手続きが完了いたしました。ご利用ありがとうございました。"
    else
      redirect_to mypage_path, alert: "退会処理中にエラーが発生しました。"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
