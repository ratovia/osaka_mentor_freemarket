class CreateSizeGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :size_groups do |t|
      t.integer :name, null: false
      t.timestamps
    end
  end
end
