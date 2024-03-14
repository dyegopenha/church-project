class Event < ApplicationRecord
  belongs_to :department

  validates :title, presence: true
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :old_date

  def unavailable_dates
    Event.where('start_date > ?', Time.now).pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def old_date
    current = Time.now
    if start_date < current
      errors.add(:start_date, "must be after #{current}")
    end
  end
end
