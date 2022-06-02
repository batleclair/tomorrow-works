class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :candidatures
  has_many :experiences
  has_one_attached :photo
end
