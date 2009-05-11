class Cms::ApplicationController < ApplicationController
  
  # include UserAuthenticate
  
  helper :all            
  # include Cms::FormBuilder
  # helper Cms::FormBuilder
  skip_before_filter :login_required
  skip_before_filter :pagination_defaults
  before_filter :cms_required
  
  verify :method => :post, :only => [:create]
  verify :method => :put, :only => [:update]
  verify :method => :delete, :only => [:destroy]
  verify :method => :get, :only => [:new,:show,:index]
  
  layout "application"
  # layout "cms/test"                                           
  
  protected
  
  def cms_required
    unless cms_user?
      store_location
      access_denied 
    end
  end
  
  def cms_user?
    current_user && current_user.cms_user?
  end
  
  def self.check_permissions(*perms)
    opts = Hash === perms.last ? perms.pop : {}
    before_filter(opts) do |controller|
      access_denied unless controller.send(:current_user).able_to?(*perms)
    end      
  end    
  
  # check any permissions
  def self.check_permissions_any(*perms)
    opts = Hash === perms.last ? perms.pop : {}
    before_filter(opts) do |controller|
      access_denied unless controller.send(:current_user).able_to_any?(*perms)
    end      
  end 

  
end
