class TraineeSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_workout
  has_many :workouts, through: :workout_trainees;
end