module ApplicationHelper
  def user_name(tweet)
    tweet.user.name || 'User'
  end
end
