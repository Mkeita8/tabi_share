class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(9)
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = "投稿しました"
      redirect_to boards_path
    else
      flash.now[:danger] = "投稿できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def show 
    @board = Board.find(params[:id])
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
    @board.board_hashtag_relations.destroy_all
    @board.destroy!
    redirect_to boards_path, status: :see_other
  end

  def bookmarks
    @q = current_user.bookmark_boards.ransack(params[:q])
    @bookmark_boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(9)
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @boards = @tag.boards
  end


  private

  def board_params
    params.require(:board).permit(:title, :body, :address, :board_image, :board_image_cache)
  end
end
