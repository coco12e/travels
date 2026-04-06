class Category < ApplicationRecord
  has_many :places, dependent: :destroy
  belongs_to :destination
end
