class CreateEntries < ActiveRecord::Migration[5.0]
  def up
    create_table :entries, id: :bigint do |t|
      t.bigint :user_id, null: false
      t.string :kind, default: :memo, limit: 16, null: false
      t.timestamps
    end
  end

  def down
    drop_table :entries
  end
end
