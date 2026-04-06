class Place < ApplicationRecord
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  has_many :trips, through: :bookmarks
end
