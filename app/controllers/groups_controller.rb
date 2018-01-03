class GroupsController < ApplicationController
  include ApplicationHelper
  before_action :set_group, only: [:conversation]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.includes(:group_users)
  end

  # GET /groups/1/conversation
  def conversation
    @message = Message.new(group_id: @group.id, user_id: current_user.id)
    unless @group.group_users.where(user_id: current_user.id).exists?
      @group.group_users.create(user_id: current_user.id)
    end
    @users = @group.group_users.map(&:user) - [current_user]
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find_by_channel_key(params[:channel_key])
  end
end