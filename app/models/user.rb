class User < ApplicationRecord
  has_many :sessions
  has_and_belongs_to_many :contacts
  has_many :facts
  has_many :friends, ->(user) { where("users.id != ?", user.id) }, through: :contacts, class_name: "User", source: :users
  scope :unmatched, -> { where.not(
    id: User.joins(:catchups).where(
          { catchups: { date: Date.today } }
        ).pluck(:id)
  )}
  has_many :catchups, through: :contacts
  
  scope :onboarded, -> { where(onboarded: true) }
  
  def catchup
    catchups.find_by(date: Date.today)
  end
  
  def decorated
    attributes.merge(
      {
        facts:,
        catchup: catchup&.attributes&.merge(
          with: catchup.users.where.not(id:).first.attributes.merge({
            facts: catchup.users.where.not(id:).first.facts
          })
        )
      }
    )
  end
  
end
