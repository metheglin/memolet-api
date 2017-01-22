class CreateTags < ActiveRecord::Migration[5.0]
  def up
    create_table :tags, id: :bigint do |t|
      t.bigint :user_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end

  def down
    drop_table :tags
  end
end
