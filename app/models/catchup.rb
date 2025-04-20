class Catchup < ApplicationRecord
  belongs_to :contact
  has_many :users, through: :contact
  has_many :messages
end
