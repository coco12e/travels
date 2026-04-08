class TripTransport < ApplicationRecord
  belongs_to :trip
  belongs_to :transport
end
