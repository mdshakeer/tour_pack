class TourPackage < ApplicationRecord
  belongs_to :user
  has_many :destinations

  scope :active, -> { where(active: true) }
end
