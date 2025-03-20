class Series < ApplicationRecord
    belongs_to :publisher
    has_many :comics
  end