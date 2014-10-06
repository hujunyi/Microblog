class MicropostsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy


  def index
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.save
    @user = current_user
    @feed_items = current_user.feed.paginate(page: params[:page])
    respond_to do |format|
      format.html { render "static_pages/home"}
      format.js
    end
    #if @micropost.save
    #  redirect_to user_path(current_user), success: "Micropost created!"
    #else
    #  @feed_items = current_user.feed.paginate(page: params[:page])
    #  render "static_pages/home"
    #end
  end

  def destroy
    @micropost.destroy
    redirect_to root_path
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id:params[:id])
    redirect_to root_path if @micropost.nil?
  end

end
