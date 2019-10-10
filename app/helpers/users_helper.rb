# frozen_string_literal: true

module UsersHelper
  def user_avatar(user, size=40)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      user.png(user.email, size: size)
    end
  end
end
