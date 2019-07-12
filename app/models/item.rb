class Item < ApplicationRecord

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :delivery_burden, presence: true
  validates :delivery_method, presence: true
  validates :delivery_prefecture, presence: true
  validates :delivery_time, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  has_many_attached :images
  has_one :buy_histories
  belongs_to :user
end
