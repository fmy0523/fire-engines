class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]


  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@fire_engines = @user.fire_engines.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully created."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end


  def correct_user
    user = User.find(params[:id])
     if current_user != user
      redirect_to new_user_session_path
     end
  end
end
