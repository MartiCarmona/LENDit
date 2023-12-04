class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast("chat_#{message.chat_id}", message: render_message(message))
  end

  private

  def render_message(message)
    # You can customize how the message is rendered for broadcasting
    ApplicationController.render(partial: 'messages/message', locals: { message: message })
  end
end
