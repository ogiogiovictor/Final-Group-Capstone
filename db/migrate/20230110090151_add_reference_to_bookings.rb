class AddReferenceToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :user_id, :integer, foreign_key: true
    add_column :bookings, :motorcycle_id, :integer, foreign_key: true
  end
end
