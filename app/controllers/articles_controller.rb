class ArticlesController < ApplicationController
  def new
    @article = current_user.authored_articles.new
    @article.categories.new
  end

  def create
    @article = current_user.authored_articles.new article_params

    if @article.save
      redirect_to root_path,
      notice: 'Article successfully created'
    else
      render :new,
      alert: 'Please check the form and re-submit'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, categories_attributes: [:name])
  end
end
