# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :number_of_people, presence: true, numericality: { greater_than: 0 }
  validates :email, presence: true
end
