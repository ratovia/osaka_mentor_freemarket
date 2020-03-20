class Brand < ApplicationRecord
  # association
  has_many :products, dependent: :destroy

  # validation
  validates :name, presence: true
end
