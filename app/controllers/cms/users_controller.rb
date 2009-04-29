class Cms::UserController < Cms::ApplicationController
  before_filter :find_model

  
         

  private
  def find_model
    @model = Cms::User.find(params[:id]) if params[:id]
  end
end