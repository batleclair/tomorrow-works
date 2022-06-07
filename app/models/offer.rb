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

    FREQUENCY ={
      "1 jour/semaine"=> 2,
      "1.5 jour/semaine"=>3,
      "2 jour/semaine"=>4,
      "2.5 jour/semaine"=>5,
    }
end
