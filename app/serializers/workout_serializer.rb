class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_hour, :duration, :trainer_id
  has_many :trainees, through: :workout_trainees
end