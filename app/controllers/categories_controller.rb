class CategoriesController < ApplicationController
  before_action :sign_in

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.order(created_at: :desc)
  end
end
