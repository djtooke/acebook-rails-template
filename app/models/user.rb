class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :name, presence:true,
  # length: {minimum: 6}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
