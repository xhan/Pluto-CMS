class Cms::SystemController < Cms::ApplicationController
  def index
    
  end

  def processes
    
  end

  def routes
    unless params[:path].blank?
      @path = params[:path]
      @route = ActionController::Routing::Routes.recognize_path(@path)
    end
    
    @routes = ActionController::Routing::Routes.routes.collect do |route|
      name = ActionController::Routing::Routes.named_routes.routes.index(route).to_s
      verb = route.conditions[:method].to_s.upcase
      segs = route.segments.inject("") { |str,s| str << s.to_s }
      segs.chop! if segs.length > 1
      reqs = route.requirements.empty? ? "" : route.requirements.inspect
      {:name => name, :verb => verb, :segs => segs, :reqs => reqs}
    end    
  end
  
  def processes_list
    render :text => %x|ps -axcr -o "pid,pcpu,pmem,time,comm"|
  end
     
  def gemlist   
    
    @list = %x[gem list]
    render :layout => false
  end
end
