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
      image: images[0] ? images[0].url : "no image",
      categories: categories.map {|category| category.name},
      reviews: reviews.as_json
    }
  end
end
