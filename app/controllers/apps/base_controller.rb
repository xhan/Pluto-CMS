class Apps::BaseController < Cms::ApplicationController      
  
  before_filter :set_site_title
  
  layout "apps"  
  
  ActiveScaffold.set_defaults do |config|
    config.ignore_columns.add [:created_at, :updated_at]
    # config.security.current_user_method = :current_login
    # config.create.columns.exclude :id
    # config.update.columns.exclude :id
  end
  
  
  # thoese comments are some tips that how to use active_scaffold here
  
  
  # def before_create_save(record)
  #   record.created_by = current_user
  # end 
  
  
  # def before_update_save(record)
  #   record.updated_by = current_user
  # end                                        
                               
  # active_scaffold :"apps/speaker" do |config|
  #   config.columns = [:id, :name, :age, :description, :price, :comments]
  #   
  #  #  config.columns[:phone_number].description = "(Format: ###-###-####)"
  #  # config.columns[:phone_number].label = "Phone"
  # 
  #   config.create.columns.exclude :id
  #   config.update.columns.exclude :id
  #   # config.list.columns.exclude :first_name, :middle_name, :last_name, :password, :phone_number
  #   # config.subform.columns = [:first_name, :last_name, :login, :password]
  # 
  #   config.list.sorting = {:id => 'ASC'}
  # end
  
  # class User < ActiveRecord::Base
  #   def to_label
  #     "User: #{username}"
  #   end
  # end  
  
  
  private



  def set_site_title
    @title ="Manage Apps"
  end
  
end