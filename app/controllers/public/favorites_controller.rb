class Public::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.favorite(@post)
    # redirect_to request.referer
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.unfavorite(@post)
    # redirect_to request.referer
  end
end
