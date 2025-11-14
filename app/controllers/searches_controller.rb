class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model   = params[:model]
    @content = params[:content]
    @method  = params[:method]

    case @model
    when 'user'
      @records = User.search_for(@content, @method)
    when 'post_tag'
      scope = Post.search_for_tag(@content, @method)
      @records = apply_post_sort(scope)
    else
      scope = Post.search_for_title(@content, @method)
      @records = apply_post_sort(scope)
    end
  end

  private

  def apply_post_sort(scope)
    sort      = params[:sort]
    direction = params[:direction] == 'asc' ? :asc : :desc
    if %w[release timeline].include?(sort)
      scope.order(sort => direction)
    else
      scope.order(created_at: :desc)
    end
  end
end