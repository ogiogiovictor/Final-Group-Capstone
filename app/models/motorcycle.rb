class Motorcycle < ApplicationRecord

  belongs_to :user
  validates :model, :description, :total_amount, presence: true

  validates_length_of :model, maximum: 50

   # validates :name, presence: true, allow_blank: false
   
   belongs_to :user

  has_one_attached :image, dependent: :destroy
  has_many_attached :pictures

  def image_as_thumbnail
    image.variant(resize_to_limit: [50, 50]).processed
  end

end
