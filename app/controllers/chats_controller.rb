class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = Chat.all
    render layout: "with_sidebar"
  end

  def create
    product = Product.find(params[:product_id])
    booking = Booking.find_or_create_by(user_id: current_user.id, product_id: product.id)
    chat = Chat.find_or_create_by(booking_id: booking.id)

    redirect_to chat_path(chat)
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
    @booking = @chat.booking
    @product = @booking.product if @booking.present?
    render layout: "with_sidebar"
  end
end
