class Booking < ApplicationRecord
  before_create :set_total_price
  belongs_to :porpoise
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :not_past_date

  enum status: [ :pending, :accepted, :declined ]

  private

  def duration
    (end_date - start_date).to_i
  end

  def set_total_price
    total_price = porpoise.price * duration
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    # ^ return nothing

    if end_date < start_date
      errors.add(:end_date, 'must not be before start date')
    end
  end

  def not_past_date
    if self.start_date < Date.today
      errors.add(:start_date, 'cannot be in the past')
    end
  end
end
