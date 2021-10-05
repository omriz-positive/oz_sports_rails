class Trainee < ApplicationRecord
  belongs_to :trainer
  validates :name, presence: true
end
