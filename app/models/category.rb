class Category < ApplicationRecord
  belongs_to :parent, class_name: :Category, foreign_key: :category_id, optional: true  
  has_many :children, class_name: :Category, foreign_key: :category_id
  has_many :items
end
