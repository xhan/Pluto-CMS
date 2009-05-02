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
    @add,@remove,@total = @templet.check_and_create_nodes!
    @templet.publish!
    respond_to do |wants|
      wants.html { render :text => "更新成功！新增加#{@add.size}张贴纸，删除废弃贴纸#{@remove.size}张，累计贴纸共#{@total.size}张！"}
      # wants.js 
    end
  end
  
  def destroy
    
  end

end
