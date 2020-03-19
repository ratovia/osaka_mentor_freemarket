class ProductCategory < ApplicationRecord
  # association
  has_many :products, dependent: :destroy
  belongs_to :size_group
  # category.sizes と使えるようになる
  delegate :sizes, to: :size_group,
  has_ancestry

  # validation
  validates :name, presence: true
end
