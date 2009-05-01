class ApplicationController < ActionController::Base
  include UserAuthenticate
  
  helper :all 
  protect_from_forgery 
  filter_parameter_logging :password

  
    
  before_filter :login_required,:pagination_defaults
  after_filter :store_location
  
  # TODO it need fix later
  rescue_from 'ArgumentError' do |exception|
    render :text => "exception"
  end
                              
  def set_layout
    if request.xhr?
      false
    else
      "application"
    end
  end
  
  def pagination_defaults
    @page = (params[:page] || 1).to_i
    @page = 1 if @page < 1
    @per_page = (params[:per_page] || (RAILS_ENV=='test' ? 1 : 10)).to_i
  end
  
end