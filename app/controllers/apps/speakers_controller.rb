class Apps::SpeakersController < Apps::BaseController
  
   # this class was dynamic created by pluto cms
   # it will be clean up & replace with new if you publish the App contains it
   # so just keep it ,not to modify this file  




  active_scaffold "apps/speaker" do |config|
    config.columns = [:id,:integer_0,:string_0,:datetime_0,:text_0,:integer_1]
	
config.columns[:integer_0].label="price"	
config.columns[:string_0].label="name"	
config.columns[:datetime_0].label="time"	
config.columns[:text_0].label="description"	
config.columns[:integer_1].label="age"	
	config.list.sorting = { :id => :desc }
    config.create.columns.exclude :id
    config.update.columns.exclude :id
  end
  

end
