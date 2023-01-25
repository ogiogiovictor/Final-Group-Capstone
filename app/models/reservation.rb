# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :reserved_from, :reserved_until, :date, presence: true
end
