class Porpoise < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  valdiates :name, :location, :species, presence: true
  validates :price, numericality: { greater_than: 0 }

  # validates :description, length: { minimum: 25 }
end
