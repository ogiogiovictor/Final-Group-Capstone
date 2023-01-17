class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :location
      t.string :model
      t.datetime :start_date
      t.datetime :end_date
      
       t.references :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
