class Department < ApplicationRecord
  has_one_attached :avatar
  has_many :users
  has_many :documents
  has_many :events

  validates :name, presence: true, uniqueness: true

  scope :name_contains, ->(param) { where('name LIKE ?', "%#{param}%") }
  scope :sorted, -> { order(name: :asc) }

  def self.options_list
    options = []
    Department.all.each do |department|
      options << [department.name, department.id]
    end
    options
  end
end
