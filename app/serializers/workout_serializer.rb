class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_hour, :duration, :trainer_id
end