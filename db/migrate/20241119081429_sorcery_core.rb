class SorceryCore < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.string :full_name, null: false
      t.string :nickname_name,       null: false

      t.timestamps                null: false
    end
  end
end
