class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token
  
  def current_user
    @current_user ||= current_session&.user
  end
  
  def current_session
    return @current_session if defined?(@current_session)
  
    token = request.env["HTTP_AUTHORIZATION"]&.split(' ')&.last
  
    return nil if token.nil?
  
    # Find a valid session (not expired) using the session token
    @current_session = Session.not_expired.find_by(token:)
  end
end
