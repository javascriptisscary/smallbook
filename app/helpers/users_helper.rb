module UsersHelper

  #make all posts from user and friends on user's profile, accessable in a single array.
  def group_posts(friendships, profile)
    posts = []
  
    #first grab all posts matching profile.id from user and from friends
    for post in profile.posts do
      if post.profile_id == profile.id
      posts.push(post)
      end
    end
  
    for friendship in friendships do
      for post in friendship.friend.posts do
        
        if post.profile_id ==profile.id
          posts.push(post)
        end
      end
    end
  
    puts "here is your array before sort #{posts}" 
  
    #reorder all posts in array by datetime
    return posts.sort!
  
  end



  def find_friends(friendships, friend_id)
    
    
    for friendship  in friendships do
      if friendship.friend.id ==friend_id
        
         
         return friendship
      end
      
    
    end

  
  end






end
