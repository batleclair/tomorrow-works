class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :nonprofit
  has_many :candidatures
  has_many :candidates, through: :candidatures

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [:title, :description, :expertise],
    associated_against: {
      nonprofit: [:mission]
    },
    using: {
      tsearch: { prefix: true }
    }
end
