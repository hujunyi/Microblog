class UsersController < ApplicationController
  before_action :set_user, only: [:update,:edit,:show,:correct_user,:destroy]
  before_action :signed_in_user, only: [:edit,:update]
  before_action :correct_user, only: [:edit,:update]
  before_action :admin_user, only: :destroy
  def new
    @user = User.new
  end

  def show
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end


  def create 
    @user = User.new(user_params)
    
    if @user.save
      sign_in @user
      redirect_to @user, success: "Welcome to the Microblog!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, success: "Profile updated!"
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, success: "User deleted."
  end

  private 
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, warning: "Please sign in!"
    end
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin? && !current_user?(@user)
  end
end
