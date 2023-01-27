# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :release_year
      t.string :color
      t.string :transmission
      t.integer :seats
      t.string :wheel_drive
      t.integer :price
      t.string :image_link

      t.timestamps
    end
  end
end
