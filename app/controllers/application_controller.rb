class ApplicationController < ActionController::Base
  include UserAuthenticate
  
  helper :all 
  protect_from_forgery 
  filter_parameter_logging :password

    
  before_filter :login_required
  after_filter :store_location
                              
  def set_layout
    if request.xhr?
      false
    else
      "application"
    end
  end
  
end