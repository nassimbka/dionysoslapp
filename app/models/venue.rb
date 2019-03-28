class Venue < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :events, dependent: :destroy
end
