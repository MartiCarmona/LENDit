class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params)
    @message.user = current_user

    if @message.save
      ChatChannel.broadcast_to(
        @chat,
        render_to_string(partial: "message", locals: { message: @message})
      )
      head :ok
      # redirect_to chat_path(@chat), notice: 'Message sent successfully.'
    else
      redirect_to chat_path(@chat), alert: 'Message could not be sent.'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
