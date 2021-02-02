class SessionsController < ApplicationController
  def new; end

  def create
    @current_user = User.find_by(name: params[:name])
    if @current_user
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user), notice: 'Logged in!'
    else
      flash.now.alert = 'User not created'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
