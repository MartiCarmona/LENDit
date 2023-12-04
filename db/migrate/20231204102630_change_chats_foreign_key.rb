class ChangeChatsForeignKey < ActiveRecord::Migration[7.1]
  def up
    # Add the 'booking_id' column to the 'chats' table
    add_column :chats, :booking_id, :bigint

    # Update existing 'chats' records with the corresponding 'booking_id' values
    # Make sure to replace 'product_id' with the actual column you want to reference
    # from the 'bookings' table
    Chat.find_each do |chat|
      chat.update(booking_id: chat.product_id)
    end

    # Remove the 'product_id' column from the 'chats' table
    remove_column :chats, :product_id

    # Add the foreign key constraint
    add_foreign_key :chats, :bookings, column: :booking_id
  end
end
