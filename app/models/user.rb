

class User < ApplicationRecord

  validates :name, presence:true, uniqueness:true,
  length: {minimum: 6}
validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness:true
validates :password_digest, uniqueness:true
 has_secure_password


end
