class Image < ApplicationRecord
  # association
  belongs_to :product, optional: true

  # validation

  # other
  mount_uploader :src, ImageUploader
end
