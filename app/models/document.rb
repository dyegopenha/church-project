class Document < ApplicationRecord
  belongs_to :department
  has_one_attached :file

  validates :file, presence: true
  validates :when, presence: true
  validates :title, presence: true

  scope :from_month, ->(date) { where(when: date.beginning_of_month..date.end_of_month) }
  scope :title_contains, ->(param) { where('title LIKE ?', "%#{param}%") }
  scope :sorted, -> { order(title: :asc) }
end
