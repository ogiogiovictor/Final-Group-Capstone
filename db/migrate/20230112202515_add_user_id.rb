class AddUserId < ActiveRecord::Migration[7.0]

  def change_table
    add_column :bookings, :user_id, :integer, null: false, foreign_key: { to_table: :users }
  end

  
end
