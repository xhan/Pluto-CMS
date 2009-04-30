class Cms::ApplicationController < ApplicationController
  
  include UserAuthenticate
  
  helper :all            
  # include Cms::FormBuilder
  # helper Cms::FormBuilder
  skip_before_filter :login_required
  skip_before_filter :pagination_defaults
  
  verify :method => :post, :only => [:create]
  verify :method => :put, :only => [:update]
  verify :method => :delete, :only => [:destroy]
  verify :method => :get, :only => [:new,:show,:index]
  
  layout "application"
  # layout "cms/test"
end
