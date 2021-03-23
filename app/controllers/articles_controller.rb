class ArticlesController < ApplicationController
  before_action :sign_in

  def index
    @category = Category.includes(:articles).order(:priority)
    @category_article = @category.map { |c| [c, c.articles.order(created_at: :desc).first] }
    @most_popular = most_popular
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

  def most_popular
    @article_hash = Vote.group(:article).count
    @article_hash.max_by { |_article, article_counts| article_counts }
  end

  def article_params
    params.require(:article).permit(:title, :body, :image, category_ids: [],
                                                           categories_attributes: %i[id name])
  end
end
