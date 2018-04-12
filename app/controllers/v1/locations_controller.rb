class V1::LocationsController < ApplicationController
  def index
    locations = Location.all

    search_terms = params["input_name_search"]
    locations = locations.where("name ILIKE ?", "%#{search_terms}%")

    render json: locations.as_json
  end

  def create
    location = Location.new(
      name: params["input_name"],
      address: params["input_address"],
      hours: params["input_hours"],
      phone_number: params["input_phone_number"],
      website: params["input_website"],
      )
    if location.save
      render json: location.as_json
    else
      render json: {errors: location.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
