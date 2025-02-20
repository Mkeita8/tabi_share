class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create destroy]
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザーを登録しました"
      redirect_to boards_path
    else
      flash.now[:danger] = "ユーザー登録に失敗しました"
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:full_name, :nickname, :email, :password, :password_confirmation)
  end
end
