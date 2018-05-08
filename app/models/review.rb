class Review < ApplicationRecord
  belongs_to :location
  belongs_to :user

  def as_json
    {
      id: id,
      body: body,
      title: title,
      created_at: created_at,
      user: user.as_json,
      location: {
        id: location.id,
        name: location.name,
        image: location.image
      }
    }
  end
end
