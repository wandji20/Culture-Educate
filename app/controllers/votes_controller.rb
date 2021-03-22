class VotesController < ApplicationController

  def create
    @vote = Vote.new(article_id: params[:article_id], user_id: current_user.id)
    @category = Category.find(params[:category_id])
    if @vote.save
      redirect_to @category,
      notice: 'Thanks for your vote'
    else
      redirect_to root_path,
      alert: 'Sonething went wrong\n Please vote again'
  end

  def destroy
    @vote = Vote.find(params[:id])
    @category = Category.find(params[:category_id])
    if @vote.destroy
      redirect_to @category,
      notice: 'You can vote again'
    else
      redirect_to @category,
      alert: 'Something went wrong. Try down voting again'
    end
  end
end
