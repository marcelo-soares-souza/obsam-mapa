class Dispositivo < ApplicationRecord
  extend FriendlyId
  friendly_id :nome, use: :slugged

  validates :nome, :presence => true

  belongs_to :user

  geocoded_by :localization
  after_validation :geocode

  def should_generate_new_friendly_id?
    nome_changed?
  end

  def localization
    self.cidade + ", " + self.uf + ", " + self.cep
  end

  def self.search(search)
    where("nome || cidade ILIKE ?", "%#{search}%") 
  end
end
