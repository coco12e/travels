class Destination < ApplicationRecord
  belongs_to :region
  belongs_to :continent
  has_many :categories
  has_many :places
  has_many :flights
end
