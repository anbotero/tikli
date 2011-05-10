helpers do
  def admin?
    request.cookies[settings.author] == settings.token
  end

  def protected!
    halt [401, 'Not authorized'] unless admin?
  end

  def profile_link(user_name)
    "<a href=\"/#{user_name}\">#{user_name}</a>"
  end
end