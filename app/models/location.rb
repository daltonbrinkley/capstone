class Location < ApplicationRecord
  has_many :reviews
  has_many :images
  has_many :location_categories
end
