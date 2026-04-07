class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  belongs_to :flight, optional: true

  belongs_to :transport, optional: true

  has_many :bookmarks, dependent: :destroy
  has_many :categories
end
