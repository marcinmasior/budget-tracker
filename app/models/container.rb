class Container < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy

  validates :name, presence: true

  def total_expenses
    records.expense.sum(:value)
  end

  def expenses_records_size
    records.expense.size
  end

  def total_income
    records.income.sum(:value)
  end

  def income_records_size
    records.income.size
  end

  def balance
    total_income - total_expenses
  end

end
