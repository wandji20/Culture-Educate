class ArticlesController < ApplicationController
  before_action :sign_in

  def index
    @category_article = Category.includes(:articles)
      .order(priority: :desc).map do |category|
        [category, category.articles.last]
      end
    @article_category_hash = Vote.group(:article).count.first
    @most_popular = @article_category_hash ? @article_category_hash[0] : Article.order(created_at: :desc).first
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.authored_articles.new
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
    params.require(:article).permit(:title, :body, :image, category_ids: [],
                                                           categories_attributes: %i[id name])
  end
end
