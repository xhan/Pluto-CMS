module Forum::TopicsHelper    
  
                   
  
  def post_info post
    if post
      "由#{post.user.login} 在 #{time_ago_in_words_cn post.created_at}前发布 "
    else
      "一般人看不见这个的。内容空！"
    end
  end
  
end
