class Fileclip < ActiveRecord::Base
  has_attached_file :f, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
