class Document < ApplicationRecord
  belongs_to :department
  has_one_attached :file

  validates :file, presence: true
  validates :when, presence: true
  validates :description, presence: true
end
