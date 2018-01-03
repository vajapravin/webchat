module ApplicationCable
  class MessagesChannel < ActionCable::Channel::Base
    def subscribed
      stream_from 'messages'
    end
  end
end