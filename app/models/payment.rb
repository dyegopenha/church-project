class Payment < ApplicationRecord
  has_one_attached :file

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  validates :kind, inclusion: { in: %w(salario conta outro) }
  validates :when, presence: true
end
