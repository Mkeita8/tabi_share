class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def index
    @boards = Board.includes(:user)
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: "投稿を作成しました"
    else
      flash.now[:danger] = "投稿を作成出来ませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end
end
