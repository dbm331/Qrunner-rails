# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mateo = User.create(first_name: 'Mateo', last_name: 'Lazo', email: 'mateo@email.com', password: 'Mateo1', password_confirmation: 'Mateo1', role: 'admin')


q1 = Question.create(question_number: '4',prompt: 'this is a prompt',image: '0')
q2 = Question.create(question_number: '4',prompt: 'this is a prompt',image: '0')
q3 = Question.create(question_number: '4',prompt: 'this is a prompt',image: '0')
q4 = Question.create(question_number: '4',prompt: 'this is a prompt',image: '0')

t1 = Test.create(test_number: '1', score: '55')

t1.questions << [q1,q2]

