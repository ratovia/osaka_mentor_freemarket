class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string         :name, null: false
      t.references     :category, foreign_key: true, index: true, default: nil
      t.timestamps
    end
  end
end
