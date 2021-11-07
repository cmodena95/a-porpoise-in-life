class Porpoise < ApplicationRecord
  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_description,
  #   against: [ :name, :description ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
      
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :name, :location, :species, presence: true
  validates :price, numericality: { greater_than: 0 }

  geocoded_by :location
  after_validation :geocode

  # validates :description, length: { minimum: 25 }
end
