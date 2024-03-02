class User < ApplicationRecord
  belongs_to :department
  has_one_attached :avatar

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :zipcode, presence: true
  validates :address, presence: true
  validates :address_number, presence: true
  validates :birthday, presence: true
  validates :office, inclusion: { in: %w(nenhum diacono presbitero pastor) }
end
