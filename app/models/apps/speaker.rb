class Apps::Speaker < AppBase
  
  
    
      cms_attr_link :name , :string_0
    
      cms_attr_link :time , :datetime_0
    
      cms_attr_link :description , :text_0
    
      cms_attr_link :price , :integer_0
    
      cms_attr_link :age , :integer_1
    
     acts_as_commentable
     acts_as_taggable
     
end
