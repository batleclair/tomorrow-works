class CandidatureNote < ApplicationRecord
  belongs_to :user
  belongs_to :candidature
end
