# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do |count|
  teacher = Teacher.create!(name: Faker::Name.name, email: "#{count}@teacher.com",
      password: "password")
  student = Student.create!(name: Faker::Name.name, email: "#{count}@student.com",
      password: "password", teacher_id: teacher.id)
  Parent.create!(name: Faker::Name.name, email: "#{count}@parent.com",
      password: "password", student_id: student.id)
  Grade.create!(assignment: Faker::Name.name, score: Faker::Number.number(2),
      student_id: student.id)
end
