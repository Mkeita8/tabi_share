class AddOfficialLinkToBoards < ActiveRecord::Migration[8.0]
  def change
    add_column :boards, :official_link, :string
  end
end
