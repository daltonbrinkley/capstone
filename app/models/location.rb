class Location < ApplicationRecord
  has_many :reviews
  has_many :images
  has_many :location_categories
  has_many :categories, through: :location_categories

  def as_json
    {
      id: id,
      name: name,
      address: address,
      hours: hours, 
      phone_number: phone_number,
      website: website,
      categories: categories.map {|category| category.name}
    }
  end
end
