class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :set_search

  def set_search
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(9)
  end

  private

  def not_authenticated
    redirect_to login_path
  end
end
