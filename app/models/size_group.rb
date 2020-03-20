class SizeGroup < ApplicationRecord
  # association
  has_many :product_categories, dependent: :destroy
  has_many :sizes, dependent: :destroy

  # validation
  validates :name, presence: true

  # enums
  enum name: {
    '洋服のサイズ': 1,
    'メンズ靴のサイズ': 2,
    'レディース靴のサイズ': 3,
    'スカートのサイズ': 4,
    'キッズ服のサイズ': 5,
    'ベビー・キッズ靴のサイズ': 6,
    'ベビー服のサイズ': 7,
    'テレビのサイズ': 8,
    'カメラレンズのサイズ': 9,
    'オートバイのサイズ': 10,
    'ヘルメットのサイズ': 11,
    'タイヤのサイズ': 12,
    'スキーのサイズ': 13,
    'スノーボードのサイズ': 14,
  }
end
