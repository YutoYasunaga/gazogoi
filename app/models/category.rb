class Category < ApplicationRecord

  has_many :words, dependent: :destroy

  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders]

  has_attached_file :image, 
    styles: { original: '480x320#' },
    default_style: :original,
    default_url: 'category/default_image.png'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :en, presence: true, length: { in: 2..25 }
  validates :vi, presence: true, length: { in: 2..25 }

  private

  def slug_candidates
    "#{slug}"
  end

  def should_generate_new_friendly_id?
    slug_changed? || slug.blank?
  end
end
