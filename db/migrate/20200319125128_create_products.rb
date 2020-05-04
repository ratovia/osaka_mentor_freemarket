class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,             null: false, default: ""
      t.integer    :price,            null: false, default: 0
      t.text       :description,      null: false
      t.integer    :condition,        null: false, default: 1
      t.integer    :delivery_burden,  null: false, default: 1
      t.integer    :delivery_method,  null: false, default: 1
      t.integer    :delivery_time,    null: false, default: 1
      t.integer    :status,           null: false, default: 1
      t.integer    :prefecture_id,    null: false, default: 1
      t.integer    :seller_id,        null: false, default: 0
      t.integer    :buyer_id
      t.references :product_category, null: false, foreign_key: true
      t.references :size
      t.references :brand
      t.timestamps
    end
  end
end
