class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.string :model
      t.string :description
      t.decimal :deposit_fee
      t.decimal :finance_fee
      t.decimal :total_amount
      t.integer :duration
      t.float :apr_percent

      t.timestamps
    end
  end
end
