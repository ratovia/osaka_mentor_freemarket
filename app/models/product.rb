class Product < ApplicationRecord
  # association
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer,  class_name: 'User', optional: true
  belongs_to :product_category
  # product.size_groupと使えるようになる
  delegate :size_group, to: :product_category
  belongs_to :size,  optional: :true
  belongs_to :brand, optional: :true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # validation
  validates :name, presence: true, length: { maximum: 40 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300,
                    less_than_or_equal_to: 9_999_999 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :condition, :delivery_burden, :delivery_method, :delivery_time, :status, :prefecture_id, presence: true
  validates :size, presence: true, if: Proc.new{ |product| product.size_group.present? }
  validate :validate_images

  # enums
  # 商品の状態
  enum condition: {
    '新品、未使用': 1,
    '未使用に近い': 2,
    '目立った傷や汚れなし': 3,
    'やや傷や汚れあり': 4,
    '傷や汚れあり': 5,
    '全体的に状態が悪い': 6,
  }
  # 配送料の負担
  enum delivery_burden: {
    '送料込み(出品者負担)': 1,
    '着払い(購入者負担)': 2,
  }
  # 発送方法
  enum delivery_method: {
    '未定': 1,
    'らくらくメルカリ便': 2,
    'ゆうメール': 3,
    'レターパック': 4,
    '普通郵便(定形、定形外)': 5,
    'クロネコヤマト': 6,
    'ゆうパック': 7,
    'クリックポスト': 8,
    'ゆうパケット': 9,
  }
  # 発送までの日数
  enum delivery_time: {
    '1~2日で発送': 1,
    '2~3日で発送': 2,
    '4~7日で発送': 3,
  }
  # 商品の取引状況
  enum status: {
    on_sale: 1,
    sold: 2,
    stopped: 3,
  }

  private

  def validate_images
    errors.add(:images, 'を入力してください') if images.length.zero?
    errors.add(:images, 'は最大10枚までです') if images.length > 10
  end
end
