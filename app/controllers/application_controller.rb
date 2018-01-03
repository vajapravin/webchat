class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  layout :custom_login
  before_action :validate_login

  def welcome
    redirect_to "/groups" and return if session[:user]
    @user = User.new
    render "/welcome/index.haml"
  end

  private

  def custom_login
    params[:action] == "welcome" ? "login" : "application"
  end

  def validate_login
    return if session[:user]
    redirect_to "/" and return unless ['welcome', 'create'].include?(params[:action])
  end
end