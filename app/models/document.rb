class Document < ApplicationRecord
  belongs_to :department
  has_one_attached :file
end
