class Exercise < ApplicationRecord
  has_many :exercise_routines, dependent: :destroy
  has_many :routines, through: :exercise_routines

  validates :description, :intensity, presence: true
  validates :intensity, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
