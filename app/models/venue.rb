class Venue < ApplicationRecord
  has_many :events, dependent: :destroy
end
