class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top terms privacy]
  def top
    @boards = Board.all
    @boards = Board.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def terms; end

  def privacy; end
end