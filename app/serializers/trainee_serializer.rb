class TraineeSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_workout
  def last_workout
    object.workouts.order(:start_hour).last
  end
end