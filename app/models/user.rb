class User < ActiveRecord::Base
  has_secure_password
  has_many :letters
  has_many :recipients

  def slug
    self.username.gsub(/_/, '-').parameterize
  end

  def self.find_by_slug(slug)
    User.all.find do |user|
      user.slug == slug
    end
  end
end
