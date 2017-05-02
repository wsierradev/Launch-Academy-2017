class User < ActiveRecord::Base
  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.provider = provider
      user.uid = uid
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar_url = auth.info.image
    end
  end

  validates :provider, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :avatar_url, presence: true

  has_many :members
  has_many :meetups, through: :members
end
