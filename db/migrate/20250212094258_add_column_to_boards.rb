class AddColumnToBoards < ActiveRecord::Migration[8.0]
  def change
    add_column :boards, :latitude, :float
    add_column :boards, :longitude, :float
  end
end
