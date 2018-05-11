class User < ApplicationRecord
  validates :name, presence:true,
  length: {minimum: 6}
validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
