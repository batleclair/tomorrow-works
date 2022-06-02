class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :nonprofit
  has_many :candidatures
  has_many :candidates, through: :candidatures
end
