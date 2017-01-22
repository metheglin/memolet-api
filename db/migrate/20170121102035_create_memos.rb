class CreateMemos < ActiveRecord::Migration[5.0]
  def up
    create_table :memos, id: false do |t|
      t.bigint :id, null: false
      t.string :content, null: false
      t.timestamps
    end

    execute("ALTER TABLE `memos` ADD PRIMARY KEY (`id`)")
  end

  def down
    drop_table :memos
  end
end
