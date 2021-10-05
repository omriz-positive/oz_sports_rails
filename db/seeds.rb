# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
zeevi = Trainer.create!(name: 'Zeevi');
p "Added Zeevi";
Trainee.create!(name: "Gilad", trainer_id: zeevi.id);
Trainee.create!(name: "Yaniv", trainer_id: zeevi.id);
Trainee.create!(name: "Hed", trainer_id: zeevi.id);
Trainee.create!(name: "Nathan", trainer_id: zeevi.id);
p "Added Trainees for Zeevi";
Workout.create!(name: "My 1st training session", trainer_id: zeevi.id, start_hour: DateTime.now);
Workout.create!(name: "My 2nd training session", trainer_id: zeevi.id, start_hour: DateTime.now, duration: 2);
Workout.create!(name: "My 3rd training session", trainer_id: zeevi.id, start_hour: DateTime.now, duration: 3);
p "Added Workout sesssions for Zeevi";