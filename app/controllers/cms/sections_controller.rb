class Cms::SectionsController < Cms::ApplicationController
  def index
    @root = Section.first
  end


  def new                   
    @parent = Section.find params[:parent_id]
    @section = Section.new(:parent_id => @parent.id)    
  end

  def create    
    @section = Section.new params[:section]
    if @section.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @section = Section.find params[:id] ,:include => :parent
    @parent = @section.parent
  end

  def update               
    # raise
    @section = Section.find  params[:id]
    if @section.update_attributes params[:section]
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def destroy
    @section = Section.find params[:id]
    flash[:notice] = 'it didnot work ' unless @section.destroy
    redirect_to :action => "index"
  end

end
