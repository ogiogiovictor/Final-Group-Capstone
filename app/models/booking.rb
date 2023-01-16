class Booking < ApplicationRecord

    belongs_to :user
    belongs_to :motorcycle
    validates :location, :model, :reserved_from, :reserved_until, :date, presence: true    
    
    # has_and_belongs_to_many :motorcycles, dependent: :destroy

end
