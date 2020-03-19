class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.string :name, null: false
      t.string :ancestry, index: true
      t.references :size_group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
