class TourPackage < ApplicationRecord
  belongs_to :user
  has_many :destinations

  scope :active, -> { where(active: true) }

  searchkick

  def search_data
  	{
  		name: name
  	}
  end

  include Searchable
end
