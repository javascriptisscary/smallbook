module CommentsHelper
  
  def find_commentor(id)
    @commentor= User.find(id)
  end

end