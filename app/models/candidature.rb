class Candidature < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  belongs_to :candidate
  has_many :candidature_notes
end
