# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
zeevi = Trainer.create(name: 'Zeevi');
yizhak =Trainer.create(name: 'Yizhak');
muhi = Trainer.create(name: 'Muhi');

# For zeevi
5.times do |i|
    Trainee.create!(name: "#{zeevi.name}'s' Trainee #{i.to_s}", trainer_id: zeevi.id);
end
p "Added Trainees for omri";
# For yizhak
5.times do |i|
    Trainee.create!(name: "#{yizhak.name}'s' Trainee #{i.to_s}", trainer_id: yizhak.id);
end
p "Added Trainees for yizhak";
# For muhi
5.times do |i|
    Trainee.create!(name: "#{muhi.name}'s' Trainee #{i.to_s}", trainer_id: muhi.id);
end
p "Added Trainees for muhi";

