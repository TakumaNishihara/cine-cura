module ApplicationHelper
  def sort_link_for_posts(title, key)
    next_dir = params[:direction] == 'asc' ? 'desc' : 'asc'

    if %w[post_title post_tag].include?(params[:model]) # 検索結果画面
      link_to title, search_path(
        model:     params[:model],
        content:   params[:content],
        method:    params[:method],
        sort:      key,
        direction: next_dir
      )
    else                                                # 通常の投稿一覧
      link_to title, posts_path(
        sort:      key,
        direction: next_dir
      )
    end
  end
end
