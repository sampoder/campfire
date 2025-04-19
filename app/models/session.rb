class Session < ApplicationRecord
  scope :not_expired, -> { where(created_at: 1.months.ago..) }
  scope :open, -> { where(token: nil, created_at: 15.minutes.ago..) }
  belongs_to :user
  before_validation do
    self.short = SecureRandom.random_number(10**6).to_s.rjust(6, '0')
  end
  def authenticate(short)
    raise ArgumentError.new "Invalid short code provided." unless short == self.short
    raise ArgumentError.new "Session is already active." unless token.nil?
    raise ArgumentError.new "Session has expired." if created_at < 15.minutes.ago

    update(token: SecureRandom.hex(16))

    return token
  end
end
