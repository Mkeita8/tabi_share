class BoardsController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  skip_before_action :require_login, only: %i[show index hashtag]
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
    @prefecture = @board.address.sub(/^〒\d{3}-\d{4} /, '')[/\A(北海道|東京都|大阪府|京都府|.+?県)/]
    @prefecture_boards = Board.where('address LIKE ?', "%#{@prefecture}%").where.not(id: @board.id).limit(3).order(created_at: :desc)
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
    if @tag
      @boards = @tag.boards.includes(:user).order(created_at: :desc).page(params[:page]).per(9)
    else
      @boards = Board.none
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :address, :official_link, :board_image, :board_image_cache)
  end

  def set_user
    @user = current_user
  end
end
