class Location < ApplicationRecord
  has_many :reviews
  has_many :images
  has_many :location_categories
  has_many :categories, through: :location_categories

  def image
    images[0] ? images[0].url : "no image"
  end

  def as_json
    {
      id: id,
      name: name,
      address: address,
      hours: hours, 
      phone_number: phone_number,
      website: website,
      image: image,
      categories: categories.map {|category| category.name},
      reviews: reviews.as_json,
      images: images.as_json
    }
  end
end
