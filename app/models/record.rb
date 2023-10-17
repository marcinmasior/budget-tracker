class Record < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :container

  validates :record_type, presence: true
  validates :value, presence: true
  validates :category, presence: true

  enum record_type: { income: 0, expense: 1 }
end
