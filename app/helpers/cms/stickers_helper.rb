module Cms::StickersHelper       
                         
  #TODO  ， is it proper to place lots of codes here? maybe i need move some to lib later  
  def sticker_tag sym , &block
    str_out = ""
    @templet = @page.templet                                       
    # TODO  if not found a node , whether or not to create a node ?
    # =>    here is default to set to find a exist
    node = @templet.sticker_nodes.with_name(sym.to_s).first
    stickers = node.stickers_in_page_id(@page.id)         
    if  !stickers.blank?
      for s in stickers                                           
        #text
        case s
        when WidgetSticker
          str_out += eval(s.content)
        # when TextSticker
        else
          str_out += content_tag(:div,s.content,:class => "sticker")
        end 
        #widget TODO dynamic erb content seems will not be exec
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
                            
  
  def visitor_position &block
    p = @page.section              
    res = ""
    while p.id != 1
      res += capture(p.name,p.path,&block)
      p = p.parent
    end
    concat res
  end
  
  def app_path name,app
    # link_to name , request.path+"/#{app.id}"
      link_to name , @page.path + "/#{app.id}"
  end         
  
  def method_missing symbol ,*arg
    "Warning : The Function Name #{symbol.to_s} doesnot Exist!";
  end
  
end
