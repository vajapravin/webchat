class MessagesController < ApplicationController
  before_action :group, only: [:index]

  def index
    @messages = @group.messages
  end

  def create
    Message.create(message_params)
  end

  private

  def group
    @group = Group.find_by_channel_key(params[:channel_key])
  end

  def message_params
    params.require(:message).permit(:content, :user_id, :group_id)
  end
end