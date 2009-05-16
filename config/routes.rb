ActionController::Routing::Routes.draw do |map|
  

  map.resources :fileclips


  # Global routes for Session 
  map.with_options(:controller => "session" ) do |session|
    session.login '/login', :action => "login"
    session.signup '/signup' , :action => "new"
    session.logout '/logout' , :action => "logout"
  end
  
  #routes for CMS
  map.namespace(:cms) do |cms|
                        
    cms.root :controller => :home, :action => "dashboard"
    
    cms.resources :sections, :member => {:position => :put}  do |section|
      section.resources :pages, :only => [:new,:create,:index]
    end
    cms.resources :templets, :member => {:check  => :get } 
    # cms.resources :pages ,:only => [:show,:edit,:update,]                 
    cms.resources :pages , :except => [:new,:create,:index],:collection => {:editable => :put} 
    cms.resources :stickers, :member => {:select  => :post}                                  
    cms.resources :widget_stickers,:member => {:select => :post }
    cms.resources :apps ,:has_many  => [:attributes] , :member => {:publish => :put}   
    cms.resources :groups 
    cms.resources :users                                         
    cms.resources :sticker_manage, :member => {:up => :put,:down => :put}
    
    # cms.resources :systems   
    # cms.resources :system , :member => {:processes => :get}
    # cms.resources :graden

  end
                              
  # routes for forums
  map.namespace(:forum) do |forum|
    forum.root :controller => "forums"
    forum.resources :forums,:collection => {:update_positions  => :post} do |f|
      f.resources :topics do |topic|
        topic.resources :posts
      end
    end
    
    # show action    it doesn't work for custom actions
    forum.connect ':id',:controller => "forums" , :action => "show" 
    # edit /1 action
    forum.connect ':action/:id',:controller => "forums"
  end
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect '*path',:controller => "cms/pages" ,:action => "show"
end
