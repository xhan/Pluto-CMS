module Cms::SectionsHelper
  # 
  # def list_as_tree object
  #   unless object.children.blank?
  #     content_tag(:ul) do
  #       content =""
  #       for item in object.children do
  #         view_content = item_view(item)
  #         content += content_tag(:li,item.children.blank? ? view_content : (view_content + list_as_tree(item) ))
  #       end #for
  #       content
  #     end  # ul
  #   end #unless
  # end # def  
                                                                                                          
  def addition_fun section
    link_to("edit",edit_cms_section_path(section)) + " " +
    link_to("up",position_cms_section_path(section,:pos=>"up")) + " " +
    link_to("down",edit_cms_section_path(section,:pos=>"down")) +  " " +
    link_to("新子节点",new_cms_section_path(:parent_id => section.id)) + " " +
    link_to("新页面",new_cms_section_page_path(section))    
  end
  
  def item_view item
      content_tag :div , :class => "bubbleInfo" do
             content_tag(:div,item.name ,:class => "trigger")  + \
             content_tag(:div,addition_fun(item) ,:class => "popup") 
      end
  end
  
  def list_as_tree object  , &block
    unless object.children.blank?
     result = content_tag(:ul) do
        content =""
        for item in object.children do
          view_content = capture(item,&block)
          # view_content = block.call(item)
          content += content_tag(:li,item.children.blank? ? view_content : (view_content + list_as_tree(item,&block) ))
        end #for
         content
      end  # ul
      concat(result)
      result
    end #unless

  end # def         
  # 
  # def sss &block  
  #   # puts "here is block function"
  #    v = block.call
  #    v+=" ...."
  #   # concat(v)
  #   # "fffsdf"   
  #   # s ="123123"
  # end
  #     
  # def list_as_tree object, &block
  #   4.times do 
  #       block.call(object)
  #   end               
  #   
  # end      

end
