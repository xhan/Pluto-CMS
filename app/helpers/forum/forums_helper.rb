module Forum::ForumsHelper   
  
  def forum_details(forum)
    "#{forum.posts.count} "+(forum.posts.count == 1 ? "post" : "posts")+" in #{forum.topics.count} "+(forum.topics.count == 1 ? "topic" : "topics")
  end
  

  
end
