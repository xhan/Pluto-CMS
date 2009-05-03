module Cms::StickersHelper       
    
  def sticker_tag sym , &block
    str_out = ""
    @templet = @page.templet                                       
    # TODO  if not found a node , whether or not to create a node ?
    # =>    here is default to set to find a exist
    node = @templet.sticker_nodes.with_name(sym.to_s).first
    stickers = node.stickers_in_page_id(@page.id)         
    if  !stickers.blank?
      for s in stickers
        str_out += content_tag(:div,s.content,:class => "sticker")
      end 
    else                
      # TODO block controll
      if block_given?
#         capture(&block)
      else
        str_out = "#{sym.to_s} is empty in #{@page.path}"
      end
    end
    #edit 
    str_out +=edit_tag(node.id,@page.id) if session[:edit]
    return str_out
  end                         
  
  def edit_tag node_id,page_id
    link_to("add or select a sticker",cms_stickers_path(:sticker_node_id => node_id,:page_id => page_id))
  end
  
  def method_missing symbol ,*arg
    "Warning : The Function Name #{symbol.to_s} doesnot Exist!";
  end
  
end
