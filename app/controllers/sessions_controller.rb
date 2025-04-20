class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(phone_number: params[:phone_number])
    user.sessions.create
    render json: { user_id: user.id }
  end

  def authenticate
    session = Session.open.find_by(user_id: params[:user_id], short: params[:short])
    token = session.authenticate(params[:short].to_i)
    render json: { user: session.user.decorated, token: }
  end
end
