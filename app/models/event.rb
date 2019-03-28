class Event < ApplicationRecord
  mount_uploader :picture, PhotoUploader
  belongs_to :venue
  has_many :event_tags, dependent: :destroy
  has_many :tags, through: :event_tags
end
