class Department < ApplicationRecord
  has_one_attached :avatar
  has_many :users
  has_many :documents

  validates :name, presence: true, uniqueness: true
end
