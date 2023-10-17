class Container < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 100 }
end
