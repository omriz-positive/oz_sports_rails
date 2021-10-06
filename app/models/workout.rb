class Workout < ApplicationRecord
  belongs_to :trainer
  has_many :workout_trainees;
  has_many :trainees, through: :workout_trainees
  validates :name, presence: true
  validates :start_hour, presence: true
end
