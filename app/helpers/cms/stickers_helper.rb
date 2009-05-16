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
          str_out += add_class_if_in_edit(eval(s.content),s) #,:class => "sticker" ,:id => s.id
        else #TextSticker
          str_out += add_class_if_in_edit(s.content,s)# ,:class => "sticker" ,:id => s.id ) 
        end 
        #add css class style if in edit
        # str_out += content_tag(:div,s.content,:class => "sticker")
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
    if page_editable?
      str_out = add_sticker_collection_head(node,@page) +str_out
      str_out = content_tag(:div,str_out,:class => "sticker_collection" )
    end
    return str_out
  end                         
    
  def add_sticker_collection_head(node,page)
    edit_content = edit_tag(node.id,page.id)
    content_tag(:div,edit_content,:class => "sticker_collection_edit")
  end
    
  def add_class_if_in_edit content ,sticker,html={:class => "sticker"}
    if page_editable?             
      edit_content = link_to(image_tag('view.png') ,cms_sticker_path(sticker) ) \
              + link_to(image_tag('arrow_up.gif') ,cms_sticker_path(sticker))  \
              + link_to(image_tag('arrow_down.gif') ,cms_sticker_path(sticker))  \
              + link_to(image_tag('close.gif') ,cms_sticker_path(sticker))  \

      content_tag(:div,edit_content,:class => "sticker_edit") + 
      content_tag(:div,content , html)
    else
      content
    end
  end
  
  def edit_tag node_id,page_id 
    link_to(image_tag('add.png'),cms_stickers_path(:sticker_node_id => node_id,:page_id => page_id))
  end
  
  def page_editable?
    !!session[:edit]
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
      if @page
        link_to name , @page.path + "/#{app.id}"
      else
        name
      end
  end         
        
  def related?
    @page && @sticker_node
  end
  
  def method_missing symbol ,*arg
    "Warning : The Function Name #{symbol.to_s} doesnot Exist!";
  end
  
end
