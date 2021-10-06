class CreateWorkoutTrainees < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_trainees do |t|
      t.references :workout, foreign_key: true
      t.references :trainee, foreign_key: true

      t.timestamps
    end
  end
end
