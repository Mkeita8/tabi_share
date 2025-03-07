class CreateHashtags < ActiveRecord::Migration[8.0]
  def change
    create_table :hashtags do |t|
      t.string :hashname
      t.timestamps
    end
    add_index :hashtags, :hashname, unique: true
  end
end
