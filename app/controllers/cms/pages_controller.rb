class Cms::PagesController < Cms::ApplicationController
  
  before_filter :setup            
  skip_before_filter :cms_required , :only => :show
  
  def index
    @pages = @section.pages.all(:order => "position")
    render :layout => false
  end

  def new             
    
  end
  
  def show
  
    @page ||= page_search || (section_search &&section_search.pages.first(:order => "position")  )
    @page ||= app_page_search
    # TODO : add expection here if page not exist
    render :text => "its under testing!" and return unless @page  
    redirect_to @page if REDIRECT_TO_FIRST_PAGE && section_search
                                                              
    @title = @page.title
    
    
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
   if @page.destroy
     flash[:notice] = "Delete Success!"
   else
     flash[:notice] = "it not works yet!"
   end
   redirect_to cms_sections_path
  end
       
  def editable
    session[:edit] =  !session[:edit]
    # respond_to do |wants|
    #   wants.html {  }
    #   wants.js  do 
    #     render :update do |page|
    #       page.replace_html 'editable',"HHHH"
    #     end
    #   end
    # end 
    stats = session[:edit] ? "打开" : "关闭"
    render :text =>  "操作成功，当前状态：#{stats}"
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
    @searched_section ||= Section.with_path(get_path).first
  end               
                  
  def app_page_search
    path , @app_id = get_app_path
    Page.with_path("#{path}_app").first
  end
  
  def get_app_path
    # path , id = get_path.split(/$\//)
    path = '/' + params[:path][0..params[:path].size-2].join('/') 
    id   = params[:path].last.to_i
    return path,id
  end           
  
  def get_path
    '/' + params[:path].join('/')
  end                                   
  
end
