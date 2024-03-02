class User < ApplicationRecord
  belongs_to :department
  has_one_attached :avatar
end
