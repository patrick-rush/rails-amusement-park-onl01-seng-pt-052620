class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update, :destroy]

  def index
  end

  def show
    redirect_to root_path if !logged_in?
    # if params[:atttraction]

    # if params[:tickets_used]
    #   current_user.subtract_tickets_used(params[:tickets_used])
    # end
    # if params[:nausea_added]
    #   current_user.add_nausea(params[:nausea_added])
    # end
    # @attraction_name = params[:attraction_name]
    
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end
  
  def edit
  end

  def update
  end

  private

  def set_user
    @user = User.find_or_create_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
