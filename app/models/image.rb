class Image < ApplicationRecord
  acts_as_taggable

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :file, styles: { medium: "580x360>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/

  validates :title, :presence => true, length: { minimum: 4 }
  validates :file, :presence => true

  belongs_to :user
end
