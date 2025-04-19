class Contact < ApplicationRecord
  has_and_belongs_to_many :users
  validates :users, length: { is: 2 }
end
