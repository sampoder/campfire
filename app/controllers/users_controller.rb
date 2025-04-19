class UsersController < ApplicationController
  def current
    render json: current_user
  end
  
  def import_contacts
    puts params[:phone_numbers]
  end
end
