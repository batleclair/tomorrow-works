class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :applications
  has_many :experiences
end
