class Apps::SpeakersController < ApplicationController         
  layout 'cms/application'            
  active_scaffold "apps/speakers" do |config|
    config.columns = [:id,:name,:age,:description,:price,:tag_list]
  end                                                              
  #comments
  
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
end
