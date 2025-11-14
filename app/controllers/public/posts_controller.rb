class Public::PostsController < ApplicationController
  
  # 投稿の閲覧は未ログインでも可
  before_action :authenticate_user_or_admin!, except: [:index, :show]

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_post_owner_or_admin!, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def index
    sort_column = params[:sort]
    sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    if %w[release timeline].include?(sort_column)
      @posts = Post.order("#{sort_column} #{sort_direction}")
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: '投稿が完了しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path @post, notice: '編集が完了しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # 「ユーザー or 管理者」のいずれかがログインしていればOK
  def authenticate_user_or_admin!
    return if user_signed_in? || admin_signed_in?
    redirect_to new_user_session_path, alert: 'ログインしてください'
  end

  # 「投稿者本人 or 管理者」以外は拒否
  def authorize_post_owner_or_admin!
    return if admin_signed_in? || (user_signed_in? && @post.user_id == current_user.id)
    redirect_to post_path(@post), alert: '権限がありません'
  end

  def post_params
    params.require(:post).permit(:title, :body, :release, :timeline, :tag, :image)
  end
end