module Cms::PagesHelper
  def editable_page_button    
    if session[:edit]
      link_to_remote('关闭',:url => editable_cms_pages_path,:method => :put, :update => "editable") 
    else
   
      link_to_remote('开启',:url => editable_cms_pages_path,:method => :put, :update => "editable")       
    end
  end    
  
end
