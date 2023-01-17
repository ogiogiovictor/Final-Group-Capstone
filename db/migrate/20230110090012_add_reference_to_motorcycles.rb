class AddReferenceToMotorcycles < ActiveRecord::Migration[7.0]
  def change
    add_column :motorcycles, :user_id, :integer, foreign_key: true
  end
end
