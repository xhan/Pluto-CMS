class CommentsController < ApplicationController
  layout 'cms/application'            
  active_scaffold do |config|
    config.columns = [:id,:comment]
  end
end
