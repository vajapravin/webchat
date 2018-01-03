class MessageObserver < ActiveRecord::Observer
  def after_create message
    ActionCable.server.broadcast('messages', {
      message: {
        content: message.content,
        channel_key: message.group.channel_key,
        profile_pic: message.sender.profile_pic,
        sent_at: message.sent_at,
        sender: {
          id: message.sender.id,
          full_name: message.sender.full_name,
          email: message.sender.email
        }
      }
    })
  end
end