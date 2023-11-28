class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price_per_day
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :condition

      t.timestamps
    end
  end
end
