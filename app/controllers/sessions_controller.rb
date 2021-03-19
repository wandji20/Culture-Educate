class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(:name params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path,
      notice: "Welcome @user.name\n You have successfully signed in"
    else
      render :new,
      alert: 'Please sign up or sign in to continue'
    end
    
  end

  def destroy
      session[current_user.id] = nil
      redirect_to root_path,
      notice: 'You have successfully Log out'
  end
end
