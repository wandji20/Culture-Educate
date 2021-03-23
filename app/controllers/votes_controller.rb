class VotesController < ApplicationController
  before_action :sign_in
  before_action :set_article

  def create
    @vote = Vote.new(article_id: params[:article_id], user_id: current_user.id)
    @category = Category.find(params[:category_id])
    if @vote.save
      @category.priority += 1
      @category.save
      redirect_to @category,
                  notice: 'Thanks for your vote'
    else
      redirect_to root_path,
                  alert: 'Something went wrong\n Please vote again'
    end
  end

  def destroy
    @vote = Vote.find_by(article_id: params[:article_id], user_id: current_user.id)
    @category = Category.find(params[:category_id])
    if @vote&.destroy
      @category.priority -= 1
      @category.save
      redirect_to @category,
                  notice: 'You can vote again'
    else
      redirect_to @category,
                  alert: "Can't Downvote article if you have not Upvoted"
    end
  end

  private
  def set_article
    redirect_to new_article_path unless Article.count.positif? 
  end
end
