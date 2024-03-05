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
  validates :office, inclusion: { in: %w(Nenhum Diacono Presbitero Pastor) }

  scope :active, -> { where(active: true) }
  scope :member, -> { where(member: true) }
  scope :pastor, -> { where(office: "Pastor") }
  scope :presbitero, -> { where(office: "Presbitero") }
  scope :diacono, -> { where(office: "Diacono") }
  scope :nenhum, -> { where(office: "Nenhum") }
  scope :birthday_month, -> { where(birthday: Date.today.beginning_of_month..Date.today.end_of_month) }
  scope :name_contains, ->(param) { where('name LIKE ?', "%#{param}%") }
  scope :sorted, -> { order(name: :asc) }

  def age
    now = Time.now.utc.to_date
    now.year - self.birthday.year - ((now.month > self.birthday.month || 
      (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end

  def self.options_for_office
    ['Nenhum', 'Diacono', 'Presbitero', 'Pastor']
  end

  def self.options_for_department
    options = []
    Department.all.each do |department|
      options << [department.name, department.id]
    end
    options
  end
end
