class Contact < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :catchups
  validates :users, length: { is: 2 }
end
