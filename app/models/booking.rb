class Booking < ApplicationRecord

    
    validates :model, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true

    
    belongs_to :user
    has_and_belongs_to_many :motorcycles, dependent: :destroy

end
