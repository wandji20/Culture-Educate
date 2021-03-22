module ApplicationHelper
  def flash_message
    if notice
      notice
    elsif alert
      alert
    end
  end

  def upvote_or_downvote(article)
    @vote = Vote.find_by(article: article, user: current_user)
    unless @vote
      link_to 'Upvote', votes_path(article_id: article.id, category_id: params[:id]), method: :post
    else
      link_to 'Downvote', vote_path(article_id: article.id, category_id: params[:id]), method: :delete
    end
  end
end
