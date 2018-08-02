class TourBooking < ApplicationRecord
  belongs_to :tour_package
  belongs_to :user
  has_many :passengers

  validates :name, presence: true, length: { minimum: 2 }
  validates :number_of_people, presence: true, numericality: { only_integer: true }

  def total_cost
  	(self.passengers.count+1) * self.tour_package.cost_per_person
  end
end
