class Destination < ApplicationRecord
  belongs_to :tour_package

  def name_date
  	"#{self.name}(#{self.date})"
  end
end
