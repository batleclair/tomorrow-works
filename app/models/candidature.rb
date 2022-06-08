class Candidature < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  belongs_to :candidate
  has_many :candidature_notes

  status = {
    Etape1: "Premier entretien",
    Etape2: "Deuxième entretien"
  }

end
