class MessagesController < ApplicationController
  def index
    render json: current_user.catchup&.messages || []
  end
  def create
    return render json: { error: "No catchup found." } if current_user.catchup.nil?
    
    current_user.catchup.messages.create(user: current_user, content: params[:content])
    
    render json: current_user.catchup.messages
  end
end
