class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :containers, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :records

  before_create :build_default_category

  private

  def build_default_category
    self.categories.build(name: 'Other')
  end
end
