module ApplicationHelper
  def user_name(tweet)
    tweet.user.username || 'Unknown'
  end
end
