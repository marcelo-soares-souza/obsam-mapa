class User < ApplicationRecord
  has_many :images
  has_many :dispositivos

  extend FriendlyId
  friendly_id :fullname, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :fullname, :presence => true
end
