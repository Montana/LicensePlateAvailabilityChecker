class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  private
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception => e
        nil
      end
    end
  
     def initialize_compositions( attrs )
        attrs.each do |attr|
          composed_of attr,
                      :class_name => "LicensePlate::Plate",
                      :mapping => [["#{attr}_state", "state"],
                                   ["#{attr}_number", "number"],
                                   ["#{attr}_expires_on", "expires_on"]] 

end
