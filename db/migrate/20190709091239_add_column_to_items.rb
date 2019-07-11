class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :user, index: true, null: false, foreign_key: true
  end
end
