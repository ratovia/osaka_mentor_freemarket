class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :size, :string
  end
end
