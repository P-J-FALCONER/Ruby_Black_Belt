class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true, length: {minimum:2}
  validates :last_name, presence: true, length: {minimum:2}
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
end
