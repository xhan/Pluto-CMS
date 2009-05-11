class Cms::AttributesController < ApplicationController
  # skip_before_filter :login_required , :only => []       
  layout :set_layout
  before_filter :setup
  def index           
    redirect_to [:cms,@app]
  end

  def new                                 
    @app_attribute = AppAttribute.new
  end

  def edit
  end
                      
  def create
    @app_attribute = @app.trs.build params[:app_attribute]

    respond_to do |wants| 

      wants.js do
        render :update do |page|  
          if @app_attribute.save
            page<<"tb_remove()"
            page.insert_html :bottom, "app_attributes", :partial => 'attribute',:object => @app_attribute 
          else
            page.alert "errors"
          end
        end
      end 

    end
  end     
  
private
  def setup
    @app = App.find params[:app_id]
    @app_attribute  = AppAttribute.find_if params[:id]
  end
end
