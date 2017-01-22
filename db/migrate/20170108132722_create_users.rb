class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users, id: :bigint do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :auth_token,       :null => false

      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true
  end

  def down
    drop_table :users
  end
end
