class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  scope :opponents, ->(user) { where.not(id: user) }

  # def opponents

  # end
end
