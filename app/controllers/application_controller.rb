class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def current_user
    authenticate unless defined?(@current_user)
    @current_user
  end

  protected
    def authenticate
      @current_user = authenticate_or_request_with_http_token do |token, options|
        User.find_by( auth_token: token )
      end
    end
end
