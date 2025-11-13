class SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]

		if @model == 'user'
      @records = User.search_for(@content, @method)
		elsif @model == "post_tag"
      @records = Post.search_for_tag(@content, @method)
		else
      @records = Post.search_for_title(@content, @method)
	  end
  end
end
