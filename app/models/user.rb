class User < ApplicationRecord
  has_many :reviews

  has_secure_password
  # validates :first_name, :last_name, presence: true
  # validates :email, presence: true, uniqueness: true

  def as_json
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      email: email
    }
  end
end
