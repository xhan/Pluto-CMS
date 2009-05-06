class WidgetSticker < Sticker                 
  belongs_to :app
  named_scope :with_action , lambda{|action| {:conditions => {:action => action },:limit => 1  } }
end
                                                             