class Income < ApplicationRecord
  has_one_attached :file

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  validates :kind, inclusion: { in: %w(dizimo oferta) }
  validates :when, presence: true
  validates :origin, presence: true

  scope :from_month, ->(date) { where(when: date.beginning_of_month..date.end_of_month) }
  scope :origin_contains, ->(param) { where('origin ILIKE ?', "%#{param}%") }
end
