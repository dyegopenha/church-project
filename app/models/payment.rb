class Payment < ApplicationRecord
  has_one_attached :file

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  validates :kind, inclusion: { in: %w(Salario Conta Outro) }
  validates :when, presence: true
  validates :favored, presence: true

  scope :from_month, ->(date) { where(when: date.beginning_of_month..date.end_of_month) }
  scope :favored_contains, ->(param) { where('favored LIKE ?', "%#{param}%") }

  def self.options_for_kind
    ['Salario', 'Conta', 'Outro']
  end
end
