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

  scope :active, -> { where(active: true) }
  scope :member, -> { where(member: true) }
  scope :pastor, -> { where(office: "pastor") }
  scope :presbitero, -> { where(office: "presbitero") }
  scope :diacono, -> { where(office: "diacono") }
  scope :nenhum, -> { where(office: "nenhum") }
  scope :birthday_month, -> { where(birthday: Date.today.beginning_of_month..Date.today.end_of_month) }
  scope :name_contains, ->(param) { where('name ILIKE ?', "%#{param}%") }
  scope :sorted, -> { order(name: :asc) }
end
