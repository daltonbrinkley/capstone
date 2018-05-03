class Image < ApplicationRecord
  belongs_to :location

  def as_json
    {
      id: id,
      title: title,
      url: url
    }
  end
end
