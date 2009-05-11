class Cms::GroupsController < Cms::ApplicationController   
  
  before_filter :setup
  
  def index
    @groups = Group.all
  end
           
  def new
     @permissions = Permission.all
  end    
  
  def create
    @group = Group.new params[:group]
    if @group.save
      flash[:notice] = "group #{@group.name} is created"
      redirect_to edit_cms_group_path(@group)
    else
      flash[:notice] = "glad to tell u that you action does't works"
      render :action => "new"
    end
  end       
                             
  def show  
    redirect_to :action => "show"  
  end
  
  def edit
    @permissions = Permission.all
  end     
  
  def update
     @group.update_attributes params[:group] 
       # flash[:notice] = "group #{@group.name} is created"
       redirect_to edit_cms_group_path(@group)

    
  end       
  
  def destroy
    
  end        
                                                 
  private
  def setup
    @group = params[:id] ? Group.find(params[:id]) : Group.new
    
  end
end
