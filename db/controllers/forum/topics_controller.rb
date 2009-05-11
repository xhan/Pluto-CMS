class Forum::TopicsController < ApplicationController    

  layout :set_layout

  skip_before_filter :login_required , :only => [:index,:show]
  before_filter :setup

  def index 
    redirect_to forum_forum_path(@forum)
  end      

  def show
    @post = @topic.posts.build
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
    @forum = Forum.find( params[:forum_id] )
    if  params[:id]  
      @topic = ForumTopic.find( params[:id],:include => :posts) 
      @posts = @topic.posts.paginate(:all, :page => params[:page], :per_page => @per_page) 
    else
      @forum.topics.build
    end
  end

end
