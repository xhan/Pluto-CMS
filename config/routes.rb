ActionController::Routing::Routes.draw do |map|

  # Global routes for Session 
  map.with_options(:controller => "session" ) do |session|
    session.login '/login', :action => "new"
    session.signup '/signup' , :action => "new"
  end
  
  #routes for CMS
  map.namespace(:cms) do |cms|
                        
    cms.root :controller => "home", :action => "dashboard"
    
    cms.resources :sections, :member => {:position => :put}
    cms.resources :templets   
    cms.resources :pages
  end
  
  # routes for forums
  map.namespace(:forum) do |forum|
    forum.root :controller => "forums"
  end
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
