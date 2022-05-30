class Application < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  belongs_to :candidate
end
