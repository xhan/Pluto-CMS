class Apps::Blog < AppBaseLite
  
  
    
      cms_attr_link :title , :string_0
    
      cms_attr_link :body , :text_0
    
      acts_as_taggable     
      

end
