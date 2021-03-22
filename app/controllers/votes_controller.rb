class VotesController < ApplicationController

  def create
    @vote = Vote.new(article_id: params[:article_id], user_id: current_user.id)
    @category = Category.find(params[:category_id])
    if @vote.save
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
    if @vote.destroy
      redirect_to @category,
      notice: 'You can vote again'
    else
      redirect_to @category,
      alert: "Can't Downvote article if you have not Upvoted"
    end
  end
end
