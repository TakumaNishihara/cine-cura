class Public::PostsController < ApplicationController
  
  # 投稿は未ログインでも見れるように
  before_action :authenticate_user!, except: [:index, :show]

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
  def post_params
    params.require(:post).permit(:title, :body, :release, :timeline, :tag, :image)
  end
end