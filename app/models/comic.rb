class Comic < ApplicationRecord
  belongs_to :user
  belongs_to :publisher
  belongs_to :series
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }

  def address
    # Combine address fields (e.g., street, city, state)
    [ street, city, state ].compact.join(", ")
  end
end
