# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    chat = Chat.find(params[:chat_id])
    stream_for chat
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    send_message(data)
  end

  def send_message(data)
    debugger
    chat = Chat.find(data["chat_id"])
    user = current_user # Implement your authentication logic here

    message = Message.create(user: user, chat: chat, content: data['content'])
    ChatChannel.broadcast_to(chat, message: render_message(message))
  end

  private

  def render_message(message)
    ApplicationController.render(partial: 'messages/message', locals: { message: message })
  end
end
