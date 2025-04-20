class ContactsController < ApplicationController
  def index
    render json: current_user.friends
  end
  def import
    friends = current_user.friends
    new = []
    params[:phone_numbers].each do |phone_number|
      user = User.find_or_create_by(phone_number:)
      next if user.id = current_user.id
      unless user.in? friends
        new << Contact.create(users: [current_user, user])
      end
    end
    render json: { count: new.length }
  end
end
