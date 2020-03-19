class Brand < ApplicationRecord
  # association
  has_many :products, dependent: :destroy

  # validation

end
