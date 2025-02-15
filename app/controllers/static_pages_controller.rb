class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[board_top index_top]
  
  def board_top
    @boards = Board.all
    @boards = Board.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def index_top
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(9)
  end
end