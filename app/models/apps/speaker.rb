class Apps::Speaker < AppBase
   
   # this class was dynamic created by pluto cms
   # it will be clean up & replace with new if you publish the App contains it
   # so just keep it ,not to modify this file

   ATTR_HASH = { :price => :integer_0, :name => :string_0, :time => :datetime_0, :description => :text_0, :age => :integer_1}.freeze 
   ATTR_HASH.each_pair do |key,value|
		cms_attr_link key , value
   end
   
   acts_as_commentable
   acts_as_taggable             

   belongs_to :created_by, :class_name => "User", :foreign_key => "foreign_0"
   belongs_to :updated_by, :class_name => "User", :foreign_key => "foreign_1"

end
