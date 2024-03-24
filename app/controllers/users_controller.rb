class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
    respond_to do |format|
      format.js # render edit.js.erb
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.js # render update.js.erb
      else
        format.js { render :edit}
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :avatar, :username, :email)
    end
end
