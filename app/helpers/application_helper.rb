module ApplicationHelper
  def current_user
    @current_user ||= current_session&.user
  end
  
  def current_session
    return @current_session if defined?(@current_session)
  
    token = params[:token]
  
    return nil if token.nil?
  
    # Find a valid session (not expired) using the session token
    @current_session = Session.not_expired.find_by(token:)
  end

end
