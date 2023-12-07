class ChangeChatsForeignKey < ActiveRecord::Migration[7.1]
  def up
    add_column :chats, :booking_id, :bigint


    Chat.find_each do |chat|
      chat.update(booking_id: chat.product_id)
    end

    remove_column :chats, :product_id

    add_foreign_key :chats, :bookings, column: :booking_id
  end
end
