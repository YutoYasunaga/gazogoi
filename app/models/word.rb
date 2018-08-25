class Word < ApplicationRecord
  belongs_to :category
  has_many :users, through: :bookmarks

  has_attached_file :image, 
    styles: { original: '480x320#' },
    default_style: :original,
    default_url: 'category/default_image.png'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :ja, presence: true
end
