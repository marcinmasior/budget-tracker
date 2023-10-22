class Category < ApplicationRecord
  belongs_to :user
  has_many :records

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
