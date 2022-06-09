class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :candidatures
  has_many :offers, through: :candidatures
  has_one_attached :photo
  has_many :cvs
end
