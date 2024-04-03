module ApplicationHelper
  def user_name(tweet)
    tweet&.user&.username || tweet&.user&.name
  end

  def user_image(user)
    p "================"
    p user.avatar.attached?
    p "=================="
    if user.avatar.attached?
      p " ---------------"
      p url_for(user.avatar)
      url_for(user.avatar)
    else
      'default-user.jpg'
    end
  end
end
