class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :name
      t.datetime :start_hour
      t.integer :duration
      t.references :trainer, foreign_key: true

      t.timestamps
    end
  end
end
