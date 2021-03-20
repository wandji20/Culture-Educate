class ArticlesController < ApplicationController
  before_action :set_article
  def new
    @article = current_user.authored_articles.new
    @article.categories.new
    #@category_options = Category.all.map{ |category| [category.name, category.id]}
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
    params.require(:article).permit(:title, :body, :category_ids =>[], categories_attributes: [:id, :name])
  end

  def set_article
    unless current_user
      redirect_to new_session_path
    end
  end
end
