module Plutocms::ErbBuilder
  module ClassMethods
    
    
  end
  
  module InstanceMethods
    require 'erb'
    
    def open_erb path="app/views/cms/apps_builder.html.erb"
      # path = path
      content =''
      open "#{RAILS_ROOT}/#{path}", 'r' do |f|
        content =f.read 
      end        
      return content
    end
    
    def generate_erb erb
      template = ERB.new erb
      
      template.result(binding)
    end
    
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end