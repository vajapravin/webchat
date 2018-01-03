module ApplicationHelper

  def current_user
    user = User.find(session[:user]["id"]) rescue nil
  end
end
