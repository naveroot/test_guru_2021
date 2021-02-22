# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create! [{ title: 'Ruby' }, { title: 'Rails' }, { title: 'Hanami' }]
users = User.create! [{ username: 'John Doe' }, { username: 'Judy Doe' }]
tests = Test.create! [{ title: 'Best practice ML in modern Ruby', level: 0, categories_id: categories[0].id},
                      { title: 'How to build monolite?', level: 1, categories_id: categories[1].id},
                      { title: 'Why not Rails?', level: 2, categories_id: categories[2].id}]
questions = Question.create! [{ body: 'Is ruby dead?',  tests_id: tests[0].id },
                              { body: 'Are you happy?',  tests_id: tests[1].id },
                              { body: 'Hanamimi is kawaimi?',  tests_id: tests[2].id }]

answers = Answer.create! [{ body: 'Exceptional!', questions_id: questions[0].id },
                          { body: 'Absolutley!', questions_id: questions[1].id },
                          { body: 'Great!', questions_id: questions[2].id }]

test_passages = TestPassage.create! [{user_id: users[0].id, test_id: tests[0].id}]