class CreateBoardHashtagRelations < ActiveRecord::Migration[8.0]
  def change
    create_table :board_hashtag_relations do |t|
      t.references :board, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
      t.timestamps
    end
  end
end
