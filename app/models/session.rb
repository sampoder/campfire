require "twilio-ruby"

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
  
  after_create_commit do
    client = ::Twilio::REST::Client.new(Rails.application.credentials.twilio[:client], Rails.application.credentials.twilio[:token])
    
    twilio_response = client.messages.create(
      from: Rails.application.credentials.twilio[:number],
      to: user.phone_number,
      body: "You login code is #{short}."
    )
  end
end
