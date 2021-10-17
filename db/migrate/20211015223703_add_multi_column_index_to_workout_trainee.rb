class AddMultiColumnIndexToWorkoutTrainee < ActiveRecord::Migration[5.2]
  def change
    add_index :workout_trainees, [:workout_id, :trainee_id]
  end
end
