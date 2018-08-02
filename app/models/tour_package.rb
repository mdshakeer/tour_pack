class TourPackage < ApplicationRecord
  belongs_to :user
  has_many :destinations
  has_many :tour_bookings

  scope :active, -> { where(active: true) }

  searchkick

  def search_data
  	{
  		name: name
  	}
  end

  include Searchable
end
