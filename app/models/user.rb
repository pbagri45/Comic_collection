class User < ApplicationRecord
    has_many :comics
    has_many :reviews

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end