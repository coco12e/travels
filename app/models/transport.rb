class Transport < ApplicationRecord
  belongs_to :destination
  has_many :trip_transports
  has_many :trips, through: :trip_transports
end
