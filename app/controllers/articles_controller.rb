class ArticlesController < ApplicationController
  before_action :sign_in

  def index
    @category = Category.includes(:articles).order(priority: :desc)
    @category_article = @category.map { |c| [c, c.articles.order(created_at: :desc).first] }
    @most_popular = most_popular[0]
  end

  def show
    @article = Article.where('id = ?',params[:id]).includes(:author, :votes).first
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
    @article_hash = Vote.includes(:article).group(:article).count
    if @article_hash.empty?
      [Article.first, nil]
    else
      @article_hash.max_by { |_article, article_counts| article_counts }
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :image, category_ids: [],
                                                           categories_attributes: %i[id name])
  end
end
