class Cms::FormBuilder < ActionView::Helpers::FormBuilder

  # =>  test methods 
  # alias xhan label
  # def select_name
  #   
  # end            
  
  def xhan(method, text = nil, options = {})
    @template.label(@object_name, method, text, objectify_options(options))
  end
end