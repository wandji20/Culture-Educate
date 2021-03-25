module ApplicationHelper
  def flash_notice()
    if notice
      'shared/notice'
    else
      'shared/empty'
    end
  end

  def flash_alert()
    if alert
      'shared/alert'
    else
      'shared/empty'
    end
  end

  def signed_in_details()
    if current_user
      'layouts/signed_in_details'
    else
      'shared/empty'
    end
  end

  def signed_out_details()
    if current_user.nil?
      'layouts/signed_out_details'
    else
      'shared/empty'
    end
  end

  def upvote_or_downvote(article)
    @vote = Vote.find_by(article: article, user: current_user)
    if @vote
      link_to 'Downvote', vote_path(article_id: article.id, category_id: params[:id]),
              method: :delete,
              class: 'btn btn-danger'
    else
      link_to 'Upvote', votes_path(article_id: article.id, category_id: params[:id]),
              method: :post,
              class: 'btn btn-success'
    end
  end

  def truncate_or_not(article)
    if article.body.length > 120
      article.body.truncate(120)
    else
      article.body
    end
  end

  def continue_reading(article)
    link_to 'continue reading', article ,class: 'secondary-color' unless article.body.length < 120
  end

  def print_article_errors(article)
    if article.errors.any?
      'shared/error_message'
    else
      'shared/empty'
    end
  end

  def print_user_errors(user)
    if user.errors.any?
      'shared/user_errors'
    else
      'shared/empty'
    end
  end

  def display_image(article)
    image_tag article.image, class: 'img-fluid' if article&.image
  end

  def display_most_popular_title(article)
    link_to article.title, article, class: 'secondary-color' if article
  end
end
