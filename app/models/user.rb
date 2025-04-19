class User < ApplicationRecord
  has_many :sessions
  has_and_belongs_to_many :contacts
  has_many :friends, ->(user) { where("users.id != ?", user.id) }, through: :contacts, class_name: "User", source: :users
end
