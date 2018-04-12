class V1::LocationsController < ApplicationController
  def index
    locations = Location.all

    search_terms = params["input_name_search"]
    locations = locations.where("name ILIKE ?", "%#{search_terms}%")

    render json: locations.as_json
  end
end
