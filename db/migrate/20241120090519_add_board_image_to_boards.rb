class AddBoardImageToBoards < ActiveRecord::Migration[8.0]
  def change
    add_column :boards, :board_image, :string
  end
end
