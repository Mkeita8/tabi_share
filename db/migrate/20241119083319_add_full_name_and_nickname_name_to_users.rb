class AddFullNameAndNicknameNameToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :nickname_name, :string
  end
end
