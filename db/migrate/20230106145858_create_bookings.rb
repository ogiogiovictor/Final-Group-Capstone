class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :location
      t.date :date
      t.date :reserved_from 
      t.date :reserved_until
      
      t.timestamps
    end
  end
end
