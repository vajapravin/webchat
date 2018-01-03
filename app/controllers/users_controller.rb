class UsersController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email]) rescue nil
    unless user
      user = User.new(user_params)
      user.profile_pic = User.profile_pic
      user.save
    else
      user.update_attributes(user_params)
    end
    session[:user] = user
    cookies.signed[:session_user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user] = nil
    redirect_to "/"
  end

  private

  def user_params
    params.require("user").permit(:email, :first_name, :last_name)
  end
end