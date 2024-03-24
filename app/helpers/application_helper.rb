module ApplicationHelper
  def user_name(tweet)
    tweet.user.name || 'User'
  end

  def user_image(user)
    user.avatar.attached? ? url_for(user.avatar) : 'default-user.jpg'
  end
end
