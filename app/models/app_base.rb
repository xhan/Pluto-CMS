class AppBase < ActiveRecord::Base                  
=begin
  TODO 1 hidden not use properties  in console  hook to_s doesnt works
       2 protected attributes for not use columns
=end                                 
                    
  
  # def set_app_name
  #   # puts "|||||||||||||||||||||||------->  into before save"
  #   self.app_name = self.class.name.sub('Apps::','')
  #   # puts "|||||||||||||||||||||||------->  #{app_name},#{title}" 
  # end  

  class << self       
                                 
    def inherited subclass 
      super if defined? super
      subclass.class_eval do
        # before_save :set_app_name
        # named_scope :self, :conditions => {:app_name  => name.sub('Apps::','')}
        # named_scope :o, :conditions => {:app_name  => name.sub('Apps::','')} 
      end
    end
    
                     
    def cms_attr_link virtual , db_column 
       alias_name db_column, virtual
    end
    
    def alias_name oldname,newname
      oldname,newname = oldname.to_s , newname.to_s
      define_method "#{newname}" do
        read_attribute(oldname) unless read_attribute(oldname).nil?
      end

      define_method "#{newname}=" do |value|
        begin
          write_attribute(oldname, value)
        rescue ArgumentError
            raise ArgumentError
        end
      end 
      
    end  # alias name
    
  end  # << self
  
  
end
