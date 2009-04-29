module Cms::ThickBoxHelper
   
   # => Usage                   
   #   Give the link a class attribute with a value of thickbox (class="thickbox")
   #   #TB_inline?height=155&width=300&inlineId=hiddenModalContent&modal=true
   #   ?KeepThis=true&TB_iframe=true&height=400&width=600
   #   self.parent.tb_remove()
   # => http://jquery.com/demo/thickbox/
   
   def thickbox_inline text, inlineId , html ={} , tb= {} 
      html_opts = {
       :title => '',
       :class => 'thickbox'
     }.merge!(html)
     tb_opts = {
       :height => 300,
       :width => 400,
       :inlineId => inlineId
     }.merge!(tb)

     path = '#TB_inline'.add_params(tb_opts)
     link_to(text, path, html_opts)
   end
                      
   
   # ajax request or iframe
   def thickbox_outline text , path , html ={} ,tb={}
     html_opts ={
       :title => ""  ,
       :class => "thickbox"    
     }.merge!(html)
     tb_opts = {
       :height  => 300,
       :width  => 400
     }.merge!(tb)
     url = path.add_params(tb_opts)
     link_to(text,url,html_opts)
   end

   
end