class UsersController < ApplicationController
    skip_before_action :require_login, only: %i[new create destroy]

    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        auto_login(@user)
        redirect_to boards_path
      else
        render :new
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
    end
  
    private
  
    def user_params
      params.require(:user).permit(:full_name, :nickname, :email, :password, :password_confirmation)
    end
end
