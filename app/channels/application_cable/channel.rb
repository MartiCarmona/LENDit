module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def subscribed
      stream_from "chat_#{params[:chat_id]}"
    end

    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end

    def send_message(data)
      chat = Chat.find(params[:chat_id])
      user = current_user # Implement your authentication logic here

      message = Message.create(user: user, chat: chat, content: data['content'])
      ActionCable.server.broadcast("chat_#{params[:chat_id]}", message: render_message(message))
    end

    private

    def render_message(message)
      ApplicationController.render(partial: 'messages/message', locals: { message: message })
    end
  end
end
