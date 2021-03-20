class ArticlesController < ApplicationController
  def new
    @article = current_user.authored_articles.new
  end

  def create
    @article = currrent_user.authored_articles.build(article_params[:article])
    if @aricle.save
      redirect_to root_path,
      notice: 'Article successfully created'
    else
      render :new,
      alert: 'Please check the form and re-submit'
    end
  end

  private
  def article_params
    params.permit(:article).require(:article, :category_attributes)
  end
end
