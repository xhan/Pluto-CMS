module Cms::ApplicationHelper
  def set_title name
    @title = name 
  end
  
  def site_title
    @title || SITE_NAME
  end            
  
  def include_path path
    request.path.include? path
  end
  
  def link_to_nav_style name, path,hover_path="/cms"
    # if path == hover_path
    #   link_to name,path,:class => "buttons-active"
    # else
    #   link_to name,path :class => "#{hover_path}"
    # end 
    link_to name,path
  end
end
