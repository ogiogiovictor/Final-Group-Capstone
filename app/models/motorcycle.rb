class Motorcycle < ApplicationRecord

  validates :model, presence: true,
  validates :description, presence: true,
  validates :total_amount, presence: true,

  has_one_attached :image
  has_many_attached :pictures

  def image_as_thumbnail
    image.variant(resize_to_limit: [50, 50]).processed
  end

end
