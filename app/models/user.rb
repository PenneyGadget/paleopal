class User < ActiveRecord::Base
  has_many :days
  has_many :entries

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"])

    user.name = auth["info"]["name"]
    user.email = auth["info"]["email"]
    user.image_url = auth["info"]["image"]
    user.oauth_token = auth["credentials"]["token"]
    user.oauth_expires_at = auth["credentials"]["expires_at"]

    user.save
    user
  end
end
