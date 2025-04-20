class UsersController < ApplicationController
  def update
    current_user.update(user_params.except(:questions))
    params[:facts]&.each do |fact|
      f = Fact.find_or_create_by(user: current_user, question: fact[:question]) do |f|
        f.answer = fact[:answer] 
      end
      f.update(answer: fact[:answer])
    end
    if current_user.facts.length > 2 && current_user.name.present?
      current_user.update(onboarded: true)
    end
    render json: current_user.decorated
  end
  
  def current
    render json: current_user.decorated
  end
  
  private
  
  def user_params
    params.permit(:name, :facts)
  end
end
