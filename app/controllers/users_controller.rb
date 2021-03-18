class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path,
      notice: "Welcome #{@user.name}\n Your Account is Ready"
    else
      render :new,
      alert: "#{@user.name} is already taken\n Please input a name"
    end
  end

  def show
    @user = User.find_by()
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
