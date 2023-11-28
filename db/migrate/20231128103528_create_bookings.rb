class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :product, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.string :delivery_method
      t.string :check_session_id
      t.decimal :total_price

      t.timestamps
    end
  end
end
