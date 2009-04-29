class Forum::TopicsController < ApplicationController    
  
  layout :set_layout
    
  skip_before_filter :login_required , :only => [:index,:show]
  before_filter :setup
  
  def index
    
  end      
  
  def show
    
  end     
  
  def new
     @post = @topic.posts.build
  end    
  
  def create

    @topic = @forum.topics.build(params[:forum_topic])
    
    @topic.profile = @topic.posts.first.profile = f_profile
    

    respond_to do |wants|
      wants.html {   }
      wants.js do
        render :update do |page|
          if @topic.save
            # page<<"alert('hi11')"
            page<<"tb_remove()"
            page.insert_html :after, "topic_labels_row", :partial => 'topic'
            # page.insert_html :after, "topic_labels_row", :partial => "topic",:locals => {:topic  => @topic}
          else
            page.alert "errors!"
          end
        end
      end
    end
  end       
  
  def edit
    
  end  
  
  private
  def setup
    @forum = Forum.find( params[:forum_id] , :include => :topics)
    #build a topic belongs to this forum
    @topic = params[:id] ? ForumTopic.find( params[:id]) : @forum.topics.build
  end
  
end
