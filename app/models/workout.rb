class Workout < ApplicationRecord
  belongs_to :trainer
  validates :name, presence: true
  validates :start_hour, presence: true
end
