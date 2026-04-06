class Bookmark < ApplicationRecord
  belongs_to :trip
  belongs_to :place
end
