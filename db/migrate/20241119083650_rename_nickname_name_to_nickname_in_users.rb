class RenameNicknameNameToNicknameInUsers < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :nickname_name, :nickname
  end
end
