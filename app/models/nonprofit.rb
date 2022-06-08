class Nonprofit < ApplicationRecord
  belongs_to :user
  has_many :offers
  validates :siret, uniqueness: true, presence: true
  validates :mission, presence: true
  has_one_attached :photo
  has_one_attached :logo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  MISSIONS = [
    "Éradication de la pauvreté",
    "Lutte contre la faim",
    "Bonne santé et bien-être",
    "Accès à l'éducation",
    "Égalité entre les sexes",
    "Accès à l'eau",
    "Énergies durables",
    "Accès à des emplois décents",
    "Infrastructure et industrie durables",
    "Réduction des inégalités",
    "Villes et communautés durables",
    "Consommation et production responsables",
    "Lutte contre les changements climatiques",
    "Océans et mers",
    "Vie terrestre",
    "Justice et paix",
    "Partenariats"
    ]
  SECTORS = [
    "Secteur 1",
    "Secteur 2",
    "Secteur 3",
    "Secteur 4",
    "Secteur 5",
    ]
end
