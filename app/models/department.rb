class Department < ApplicationRecord
  has_one_attached :avatar
  has_many :users
  has_many :documents
  has_many :events

  validates :name, presence: true, uniqueness: true

  scope :name_contains, ->(param) { where('name LIKE ?', "%#{param}%") }
  scope :sorted, -> { order(name: :asc) }
end
