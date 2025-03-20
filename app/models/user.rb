class User < ApplicationRecord
    has_many :comics
    has_many :reviews
  end