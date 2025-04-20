class MatchingJob < ApplicationJob
  def perform(prompt)
    User.all.onboarded.includes(:friends).sort_by { |u| u.friends.length }.each do | u |
      next if u.friends.unmatched.onboarded.none?
      
      f = u.friends.unmatched.onboarded.sample
      
      u.contacts.where(id: f.contacts).first.catchups.create(date: Date.today, prompt:)
    end
  end
end

# Prompts
# What made you smile recently?
# What's something kind that someone did recently for you?
# 