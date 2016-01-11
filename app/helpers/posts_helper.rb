module PostsHelper
  
  #make time and date more legiable. 
  def clean_date(dateTime)
    
    
    string1= dateTime.to_s
    puts "this is the time in a string #{string1}"
    time =string1.slice(11..15)
    date =string1.slice(0..10)
    
    day = date.slice!(8..9)
    month =date.slice!(5..6)
    year = date.slice!(0..3)
  
    #subtract the 0 for legiablity
    if day.slice(0) =="0"
      day.slice!(0)
    end
  
  
    clean_month =set_month(month)
  
    return "#{clean_month} #{day}, #{year} at #{time} UTC"
  
  end
  
  
  
  
  
  #match number to month
  def set_month(month)
    case month
    when "01"
        month = "January"
    when "02"
        month = "February"
    when "03"
        month = "March"
    when "04"
        month = "April"
    when "05"
        month = "May"
    when "06"
        month = "June"
    when "07"
        month = "July"
    when "08"
        month = "August"
    when "09"
        month = "September"
    when "10"
        month = "October"
    when "11"
        month = "November"
    when "12"
        month = "December"
    
    end      
   
    
  end
   
  
  
  def show_likes(post)
    x=0
    post.likes.each do |like|
      x=x+1
    end
  
    return x
  
  end
  
  def user_already_liked(post)
    post.likes.each do |like|
      if like.user_id ==current_user.id
        return like
      end
    end
    
    return false
  end
  
  
  
  
  
end
