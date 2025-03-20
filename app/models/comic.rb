class Comic < ApplicationRecord
  belongs_to :user
  belongs_to :publisher
  belongs_to :series
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :user, presence: true

  # Remove the geocoding logic and address method
  # geocoded_by :address
  # after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }

  # Remove address method
  # def address
  #   [ street, city, state ].compact.join(", ")
  # end
end
