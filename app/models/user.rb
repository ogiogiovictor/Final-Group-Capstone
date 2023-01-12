class User < ApplicationRecord

     # relationships
  has_many :motorcycles, dependent: :destroy
  has_many :bookings, dependent: :destroy

end
