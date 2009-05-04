class Apps::New < AppBase
  
  #attr_accessor :title, :body ,:type
  cms_attr_link :title , :string_1
  cms_attr_link :body ,  :string_2
  cms_attr_link :user_id , :froeign_1
  
end
