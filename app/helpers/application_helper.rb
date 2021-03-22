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

  def truncate_or_not(article)
    if article.body.length > 150
      article.body.truncate(150)
    else
      article.body
    end
  end

  def continue_reading(article)
    link_to 'continue reading' unless article.body.length < 150 
  end

  def print_article_errors(article)
    'shared/error_message' if article.errors.any?
  end

  def print_user_errors(user)
    'shared/user_errors' if user.errors.any?
  end
end
