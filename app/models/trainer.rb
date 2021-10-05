class Trainer < ApplicationRecord
    has_many :trainees
    has_many :workouts
    validates :name, presence: true
    validates_associated :trainees, :workouts
end
