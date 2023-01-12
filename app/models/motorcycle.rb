class Motorcycle < ApplicationRecord

  validates :model, presence: true
  validates :description, presence: true
  validates :total_amount, presence: true

  validates_length_of :model, maximum: 50

   # validates :name, presence: true, allow_blank: false

  has_one_attached :image, dependent: :destroy
  has_many_attached :pictures

  def image_as_thumbnail
    image.variant(resize_to_limit: [50, 50]).processed
  end

end
