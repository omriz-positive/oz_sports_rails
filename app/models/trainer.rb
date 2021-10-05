class Trainer < ApplicationRecord
    has_many :trainees
    validates :name, presence: true
    validates_associated :trainees
end
