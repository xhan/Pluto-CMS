module CmsApps

      def self.included(base)
        base.extend(ClassMethods)
      end
 
      module ClassMethods
        
        class CmsLinkHelper 
           
          # render every
          def method_missing symbol ,*arg
           # "Warning : The Function Name #{symbol.to_s} doesnot Exist!";
           
          end
          
        end                                                             
        
        def alias_name oldname,newname
          
          define_method "#{newname}" do
            read_attribute(oldname) unless read_attribute(oldname).nil?
          end

          define_method "#{newname}=" do |value|
            begin
              write_attribute(oldname, value)
            rescue ArgumentError
                
            end
          end 
          
        end
        
        def acts_as_tree(options = {})
          configuration = { :foreign_key => "parent_id", :order => nil, :counter_cache => nil }
          configuration.update(options) if options.is_a?(Hash)

          belongs_to :parent, :class_name => name, :foreign_key => configuration[:foreign_key], :counter_cache => configuration[:counter_cache]
          has_many :children, :class_name => name, :foreign_key => configuration[:foreign_key], :order => configuration[:order], :dependent => :destroy

          class_eval <<-EOV
            include ActiveRecord::Acts::Tree::InstanceMethods

            def self.roots
              find(:all, :conditions => "#{configuration[:foreign_key]} IS NULL", :order => #{configuration[:order].nil? ? "nil" : %Q{"#{configuration[:order]}"}})
            end

            def self.root
              find(:first, :conditions => "#{configuration[:foreign_key]} IS NULL", :order => #{configuration[:order].nil? ? "nil" : %Q{"#{configuration[:order]}"}})
            end
          EOV
          
        end
        
        def link_attributes &proc
          raise ArgumentError, "Missing block" unless block_given?
        end
        
      end

      module InstanceMethods

      end

end
