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
      redirect_to boards_path
    else
      render :new, status: :unprocessable_entity
    end

    def edit
      @board = current_user.boards.find(params[:id])
    end

    def update
      @board = current_user.boards.find(params[:id])
      if @board.update(board_params)
        redirect_to board_path(@board)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @board = current_user.boards.find(params[:id])
      board.destroy!
      redirect_to boards_path
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end
end
