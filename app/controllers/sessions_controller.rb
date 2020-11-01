class SessionsController < ApplicationController

    def index

    end
    
    def new
        @users = User.all
    end

    def create
        # binding.pry
        @user = User.find_by(name: params[:user_name])
        if @user && @user.authenticate(params[:user_password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to signin_path
        end
    end

    def destroy
        session.clear if session[:user_id]
        redirect_to root_path
    end

end
