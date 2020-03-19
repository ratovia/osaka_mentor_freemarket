class SizeGroup < ApplicationRecord
  # association
  has_many :product_categories, dependent: :destroy
  has_many :sizes, dependent: :destroy

  # validation
end
