class Tag < ApplicationRecord
  has_many :conversion_words, dependent: :destroy
  has_many :event_tags, dependent: :destroy
  has_many :events, through: :event_tags
end
