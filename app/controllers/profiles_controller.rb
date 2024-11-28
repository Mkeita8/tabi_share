class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:full_name, :nickname, :email, :avatar, :avatar_cache)
  end
end
