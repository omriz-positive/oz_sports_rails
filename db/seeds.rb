# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
zeevi = Trainer.create!(name: 'Zeevi');
p "Added Zeevi";

gilad = Trainee.create!(name: "Gilad", trainer_id: zeevi.id);
yaniv = Trainee.create!(name: "Yaniv", trainer_id: zeevi.id);
hed = Trainee.create!(name: "Hed", trainer_id: zeevi.id);
nathan = Trainee.create!(name: "Nathan", trainer_id: zeevi.id);
p "Added Trainees for Zeevi";

now = DateTime.now;
w1 = Workout.create!(name: "My 1st training session", trainer_id: zeevi.id, start_hour: now);
w2 = Workout.create!(name: "My 2nd training session", trainer_id: zeevi.id, start_hour: now.tomorrow , duration: 2);
w3 = Workout.create!(name: "My 3rd training session", trainer_id: zeevi.id, start_hour: now.tomorrow.tomorrow, duration: 3);
p "Added Workout sesssions for Zeevi";

WorkoutTrainee.create!(workout_id: w1.id, trainee_id: nathan.id);
WorkoutTrainee.create!(workout_id: w1.id, trainee_id: yaniv.id);
WorkoutTrainee.create!(workout_id: w1.id, trainee_id: hed.id);
p "Added Trainees for the 1st workout";

WorkoutTrainee.create!(workout_id: w2.id, trainee_id: nathan.id);
WorkoutTrainee.create!(workout_id: w2.id, trainee_id: yaniv.id);
p "Added Trainees for the 2nd workout";

WorkoutTrainee.create!(workout_id: w3.id, trainee_id: nathan.id);
WorkoutTrainee.create!(workout_id: w3.id, trainee_id: yaniv.id);
WorkoutTrainee.create!(workout_id: w3.id, trainee_id: gilad.id);
p "Added Trainees for the 3rd workout";