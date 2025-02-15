class AddAddressToBoards < ActiveRecord::Migration[8.0]
  def change
    add_column :boards, :address, :string
  end
end
