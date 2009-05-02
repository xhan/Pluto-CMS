class Cms::TempletsController < Cms::ApplicationController
  def index            
    @templets = Templet.all
  end

  def show                 
    @templet = Templet.find params[:id]
  end

  def new                              
    @templet = Templet.new
  end

  def edit                
    @templet = Templet.find params[:id]
  end                                  
  
  def check
    @templet = Templet.find params[:id]
    @templet.check_stickers
    flash[:notice] = "found #{@templet.nodes.size}"
    render :action => "edit"
  end            
  
  def update
   @templet = Templet.find params[:id]
   if @templet.update_attributes params[:templet] 
     flash[:notice] = "更新成功"
     redirect_to :action  => :index
   else
     render :action => "edit"
   end
  end
  
  def create
    @templet = Templet.new params[:templet]
    if @templet.save
      @templet.publish!
      redirect_to :action => "index"
    else
      render :action => :edit
    end  
  end   
  
  def republish
    @templet = Templet.find params[:id]
    @templet.publish!
    respond_to do |wants|
      wants.html { render :text => "更新成功！"}
      # wants.js 
    end
  end
  
  def destroy
    
  end

end
