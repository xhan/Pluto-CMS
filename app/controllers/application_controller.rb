class ApplicationController < ActionController::Base
  helper :all 
  protect_from_forgery 

  include UserAuthenticate
    
  filter_parameter_logging :password
  
end