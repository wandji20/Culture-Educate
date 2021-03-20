class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path,
                  notice: "Welcome #{current_user.name}\n You have successfully signed in"
    else
      render :new,
             alert: 'Please Enter a valid name'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path,
                notice: 'You have successfully Log out'
  end
end
