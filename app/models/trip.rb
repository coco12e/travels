class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  belongs_to :flight, optional: true
  has_many :bookmarks
  has_many :trip_transports
  has_many :transports, through: :trip_transports
end
