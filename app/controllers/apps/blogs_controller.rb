class Apps::BlogsController < Apps::BaseController
  
  
  active_scaffold "apps/blog" do |config|
    config.columns = [:id,:title,:tag_list,:text_0]
    config.create.columns.exclude :id
    config.update.columns.exclude :id
    config.columns[:text_0].label ="body"
  end
  
  # before_filter :find_model
  # 
  # 
  # 
  # private
  # def find_model
  #   @model = Blogs.find(params[:id]) if params[:id]
  # end 
end