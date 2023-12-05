class AddTimestampToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :timestamp, :datetime
  end
end
