class Trainer < ApplicationRecord
    has_many :trainees, dependent: :destroy 
    has_many :workouts, dependent: :destroy 
    validates :name, presence: true
    validates_associated :trainees, :workouts
end
