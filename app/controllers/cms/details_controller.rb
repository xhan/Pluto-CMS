class Cms::DetailsController < Cms::ApplicationController
  def index
    @user = User.first
  end      
  
  def process
    
  end
end
