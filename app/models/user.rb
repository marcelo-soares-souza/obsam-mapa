class User < ApplicationRecord
  has_many :dispositivos

  extend FriendlyId
  friendly_id :fullname, use: :slugged

  # :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :fullname, :presence => true
end
