class Trainee < ApplicationRecord
  belongs_to :trainer
  has_many :workout_trainees;
  has_many :workouts, through: :workout_trainees
  validates :name, presence: true
end
