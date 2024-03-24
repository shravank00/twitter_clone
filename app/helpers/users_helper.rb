module UsersHelper
  def user_image(user)
    user.avatar.attached? ? url_for(user.avatar) : 'default-user.jpg'
  end
end
