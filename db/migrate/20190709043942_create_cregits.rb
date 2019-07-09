class CreateCregits < ActiveRecord::Migration[5.2]
  def change
    create_table :cregits do |t|

      t.timestamps
    end
  end
end
