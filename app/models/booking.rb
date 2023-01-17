class Booking < ApplicationRecord

    belongs_to :user
    belongs_to :motorcycle
    validates :location, :model, :start_date, :end_date, :date, presence: true    
    
    # has_and_belongs_to_many :motorcycles, dependent: :destroy

end
