class TourPackage < ApplicationRecord
  belongs_to :user

  scope :active, -> { where(active: true) }
end
