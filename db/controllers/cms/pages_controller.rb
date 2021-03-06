class Cms::PagesController < Cms::ApplicationController
  
  before_filter :setup
  
  def index
    @pages = @section.pages.all(:order => "position")
    render :layout => false
  end

  def new             
    
  end
  
  def show
    # unless @page
    #   url =  '/' + params[:path].join('/')
    #   @page = Page.with_path(url).first
    #   unless @page
    #     render :text => "its under testing!" and return        
    #   end
    # end  
    # render :text =>  @templet.@page_title and return    
    @page ||= page_search || section_search.pages.first(:order => "position")
    # TODO : add expection here if page not exist
    render :text => "its under testing!" and return unless @page  
    redirect_to @page if REDIRECT_TO_FIRST_PAGE && !page_search
    
    respond_to do |wants|
      wants.html  do 
        render :layout => @page.templet.layout_path
      end
    end
  end

  def create               
    @page = @section.pages.build params[:page]
    if @page.save
      flash[:notice] = 'new page created'
      redirect_to cms_sections_path
    else
      render :action => :new
    end
  end

  def edit
    session[:edit] =  !session[:edit] 
    redirect_to :action  => :show
  end

  def update
  end

  def destroy
  end
       

  private
  def setup
    @section = Section.find params[:section_id] if params[:section_id]
    if params[:id]                
      @page = Page.find params[:id]
    else
       @page = @section.pages.build if @section
    end
  end         
  
  def page_search
    @seacrhed_page ||= Page.with_path(get_path).first           
  end
  
  
  def section_search                 
    Section.with_path(get_path).first
  end               
  
  def app_search
    
  end           
  
  def get_path
    '/' + params[:path].join('/')
  end                                   
  
end
