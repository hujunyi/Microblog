class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @user = User.find_by(email: "hujunyi1990@gmail.com")
      redirect_to user_path(@user)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
