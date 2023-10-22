class Record < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :container

  validates :record_type, presence: true
  validates :value, presence: true
  validates :category_id, presence: true

  enum record_type: { income: 0, expense: 1 }

  def self.ransackable_attributes(auth_object = nil)
    %w(category_id date description paid record_type)
  end
end
