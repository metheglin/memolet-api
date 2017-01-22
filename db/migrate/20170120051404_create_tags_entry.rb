class CreateTagsEntry < ActiveRecord::Migration[5.0]
  def up
    create_table :tags_entries, id: :bigint do |t|
      t.bigint :tag_id, null: false
      t.bigint :entry_id, null: false
      t.timestamps
    end
  end

  def down
    drop_table :tags_entries
  end
end
