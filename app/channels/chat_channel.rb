# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    chat = Chat.find(params[:chat_id])
    stream_for chat
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
