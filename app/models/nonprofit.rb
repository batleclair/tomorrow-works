class Nonprofit < ApplicationRecord
  belongs_to :user
  has_many :offers
  # validates :mission, inclusion: { in: ['Pas de pauvreté',
  #                                       'Faim « Zéro »',
  #                                       'Bonne santé et bien-être',
  #                                       'Éducation de qualité',
  #                                       'Égalité entre les sexes',
  #                                       'Eau propre et assainissement',
  #                                       "Énergie propre et d'un coût abordable",
  #                                       "Travail décent et croissance économique",
  #                                       "Industrie, innovation et infrastructure",
  #                                       "Inégalités réduites",
  #                                       "Villes et communautés durable",
  #                                       "Consommation et production responsables",
  #                                       "Lutte contre les changements climatiques",
  #                                       "Vie aquatique",
  #                                       "Vie terrestre",
  #                                       "Paix, justice et institutions efficaces",
  #                                       "Partenariats pour la réalisation des objectifs"] }
end
