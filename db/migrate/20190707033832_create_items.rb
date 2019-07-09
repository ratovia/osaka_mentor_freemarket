class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.integer :price, null: false, default: 0
      t.text :description, null: false
      t.string :status, null: false, default: ""
      t.string :delivery_burden, null: false, default: ""
      t.string :delivery_method, null: false, default: ""
      t.string :delivery_prefecture, null: false, default: ""
      t.string :delivery_time, null: false, default: ""

      t.timestamps
    end
  end
end
