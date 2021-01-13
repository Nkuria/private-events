class UsersController < ApplicationController
    include UsersHelper
    

    def new
        @current_user = nil
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash.notice = "Error"
        end
    end

    def show
        @user = User.find(params[:id])
        @created_events = User.includes(:events_created).find(params[:id]).events_created
    end
end
