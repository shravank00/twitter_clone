class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :follow, :unfollow]

  def edit
    respond_to do |format|
      format.js # render edit.js.erb
    end
  end

  def update
    p "hello"
    respond_to do |format|
      if @user.update(user_params)
        p user_params
        p @user.avatar
        p "hiii"
        format.js # render update.js.erb
      else
        format.js { render :edit}
      end
    end
  end

  def follow
    current_user.following << @user unless current_user.following.include?(@user)
    respond_to do |format|
      format.js # Render follow.js.erb
    end
  end

  def unfollow
    current_user.following.delete(@user)
    respond_to do |format|
      format.js # Render follow.js.erb
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:avatar, :name, :username, :email)
    end
end
