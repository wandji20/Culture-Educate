class UsersController < ApplicationController
  before_action :sign_in, except: [:new, :create]

  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path,
                  notice: "Welcome #{current_user.name}\n Your Account is Ready"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @authored_articles = current_user.authored_articles.includes(:categories, :author)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def sign_in
    redirect_to new_session_path unless current_user
  end
end
