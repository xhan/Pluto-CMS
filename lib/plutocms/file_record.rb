module Plutocms::FileRecord 
  #be extend in class methods of ActiveRecord
  def self.included(base)
    # puts "ready to extend"
    base.extend ClassMethods
  end 
                                         
  # include Plutocms::FileRecord::InstanceMethods  
  
  module ClassMethods            
    class_eval {
      def xxx
        puts 'eval Class method works'
      end
    }
    #it didnot works !!!!! booo   
    instance_eval {
      def xxx
        puts 'eval instance method works'
      end
    }
    def xhan
      puts 'class method works'
    end
  end
  
  module InstanceMethods
    def xhan  
      puts 'instance method works'
    end
  end
end