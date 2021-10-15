class Trainee < ApplicationRecord
  belongs_to :trainer
  has_many :workout_trainees, dependent: :destroy 
  has_many :workouts, through: :workout_trainees
  validates :name, presence: true
end
