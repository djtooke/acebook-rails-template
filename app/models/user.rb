

class User < ApplicationRecord

  validates :name, presence:true, uniqueness:true,
  length: {minimum: 6}
validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness:true
validates :password, uniqueness:true
  
  has_many :posts
end
