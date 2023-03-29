class Table < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
  # associations
  belongs_to :user
  has_many :reservations

  # scopes
  scope :available, -> { where(available: true) }
end
