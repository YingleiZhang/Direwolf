class User < ActiveRecord::Base
  has_many :admins
  has_many :seekers
  has_many :employers
  def self.login(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  def self.logout(id)
    user = find(id)
    user.destroy
  end
end
