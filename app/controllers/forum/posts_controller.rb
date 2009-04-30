class Forum::PostsController < ApplicationController
  def show
    
  end 
  
  def new
    
  end
  
  def create
    # raise
    @topic = ForumTopic.find params[:topic_id]
    @post = @topic.posts.build params[:forum_post]
    @post.profile = f_profile
    if @post.save
      flash[:notice] = "thanks for your reviews"
      go_back forum_forum_topic_path(@topic.forum,@topic)
    else
      flash[:notice] = "opps, it does't work !" 
      go_back forum_forum_topic_path(@topic.forum,@topic)
    end
  end
end
