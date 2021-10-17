class WorkoutsSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_hour, :duration, :trainer_id
end
