class Comic < ApplicationRecord
  belongs_to :user
  belongs_to :publisher
  belongs_to :series
end
