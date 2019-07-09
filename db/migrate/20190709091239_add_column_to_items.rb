class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :user_id, :bigint, null: false, foreign_key: true
  end
end
