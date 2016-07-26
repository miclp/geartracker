class User < ActiveRecord::Base
  has_many :gears
  has_secure_password

  def slug
    self.username.parameterize
  end

  def self.find_by_slug(slug)
    self.all.detect {|user| user.slug == slug}
  end
end
