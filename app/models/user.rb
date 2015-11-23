class User < ActiveRecord::Base
  def self.create_from_auth_hash(auth)
    user = User.create(
      email: auth.info.email,
      name: auth.info.name,
      username: auth.info.nickname)
    user
  end
end
