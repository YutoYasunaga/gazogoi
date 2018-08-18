class Category < ApplicationRecord
  has_attached_file :image, 
    styles: { original: '480x320#' },
    default_style: :original,
    default_url: 'category/default_image.png'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :en, length: { in: 2..25 }
  validates :vi, length: { in: 2..25 }
  validates :slug, length: { in: 2..25 }
end
