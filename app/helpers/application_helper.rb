module ApplicationHelper
  def user_name(tweet)
    tweet&.user&.username || tweet&.user&.name
  end

  def user_image(user)
    if user.avatar.attached?
      url_for(user.avatar)
    else
      'default-user.jpg'
    end
  end
end
