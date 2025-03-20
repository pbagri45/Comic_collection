class Comic < ApplicationRecord
  belongs_to :user
  belongs_to :publisher
  belongs_to :series
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true  
end