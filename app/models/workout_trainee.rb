class WorkoutTrainee < ApplicationRecord
  belongs_to :workout
  belongs_to :trainee
  validates :workout, uniqueness: { scope: :trainee }
end
