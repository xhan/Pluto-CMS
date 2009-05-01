module Cms::StickersHelper       
    
  def sticker_tag id , &block
    
  end
  
  def method_missing symbol ,*arg
    "Warning : The Function Name #{symbol.to_s} doesnot Exist!";
  end
  
end
