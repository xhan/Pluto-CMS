class RenameType < ActiveRecord::Migration   
=begin
  TODO some erros here , it seem that the migration works correct ,but msg shows aborted ,  and the version didnt 
       set up to current . schema is not updated yet ..  but the columns in db was right fit this migration.
       it need to experiment later   
=end
 def self.up
   rename_column :apps, :type, :category
   rename_column :app_attributes, :type, :category
 end

 def self.down
   rename_column :app_attributes, :category, :type
   rename_column :apps, :category, :type
 end                                                                 

end
