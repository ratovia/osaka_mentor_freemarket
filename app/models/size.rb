class Size < ApplicationRecord
  # assciation
  has_many :products, dependent: :destroy
  belongs_to :size_group

  # validation
end
