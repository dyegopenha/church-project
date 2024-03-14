class Event < ApplicationRecord
  belongs_to :department

  validates :title, presence: true
  validates :start_time, :end_time, presence: true
  validate :end_time_after_start_time

  def unavailable_dates
    Event.where('start_date > ?', Time.now).pluck(:start_time, :end_time).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  private

  def end_time_after_start_time
    if end_time < start_time
      errors.add(:end_time, "must be after the start date")
    end
  end
end
