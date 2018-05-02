class V1::ReviewsController < ApplicationController
  def index
    reviews = Review.all
    render json: reviews.as_json
  end

  def create
    review = Review.new(
      title: params["input_title"],
      body: params["input_body"],
      # user_id: params["input_user_id"],
      user_id: current_user.id,
      location_id: params["input_location_id"]
      )
    if review.save
      render json: review.as_json
    else
      render json: {errors: review.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    review_id = params["id"]
    review = review.find_by(id: review_id)
    review.destroy
    render json: {message: "Review successfully deleted!" }
  end
end
