class Item < ApplicationRecord
  has_one :buy_history
  belongs_to :user
  has_many :comments
  has_many_attached :images
  belongs_to :category
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true
  # accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true, reject_if: :reject_images

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :delivery_burden, presence: true
  validates :delivery_method, presence: true
  validates :delivery_prefecture, presence: true
  validates :delivery_time, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validate :images_validation

  # def reject_images(images_attributes)
  #   images_attributes.src.blank?
  # end

  def images_validation
    if images.attached?
      errors.add(:images, "画像の枚数は最大10枚までです。") if images.length > 10
      byte_sum = 0
      images.each do |image|
        errors.add(:images, "#{image.filename}: 画像のサイズは最大3Mまでです。") if image.blob.byte_size > (3 * 1024 * 1024)

        errors.add(:images, "#{image.content_type}: 画像のフォーマットではありません。") unless image.content_type.starts_with?('image/')
        byte_sum += image.blob.byte_size
      end

      errors.add(:images, "画像のサイズは最大(合計)15Mまでです。") if byte_sum > (15 * 1024 * 1024)
    else
      errors.add(:images, ": 画像が1枚以上必要です")
    end
  end
end
