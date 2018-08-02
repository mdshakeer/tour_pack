class Passenger < ApplicationRecord
  belongs_to :tour_booking

  # validates :name, presence: true, length: { minimum: 2 }
  # validates :age, presence: true, numericality: { only_integer: true }
end
