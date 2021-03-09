# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create! [{ title: 'Ruby' }, { title: 'Rails' }, { title: 'Hanami' }]
users = User.create! [{ username: 'John Doe', email: 'user1@example.com' },
                      { username: 'Judy Doe', email: 'user2@example.com' }]
tests = Test.create! [{ title: 'Best practice ML in modern Ruby', level: 0, category_id: categories[0].id, author_id: 1 },
                      { title: 'How to build monolite?', level: 1, category_id: categories[1].id, author_id: 1 },
                      { title: 'Why not Rails?', level: 2, category_id: categories[2].id, author_id: 1 }]
questions = Question.create! [{ body: 'Is ruby dead?',  test_id: tests[0].id },
                              { body: 'Are you happy?', test_id: tests[1].id },
                              { body: 'Hanamimi is kawaimi?',  test_id: tests[2].id }]

answers = Answer.create! [{ body: 'Exceptional!', question_id: questions[0].id, correct: true },
                          { body: 'Bad!', question_id: questions[0].id },
                          { body: 'Idk!', question_id: questions[0].id },
                          { body: 'Good!', question_id: questions[0].id },
                          { body: 'Absolutley!', question_id: questions[1].id },
                          { body: 'Great!', question_id: questions[2].id }]

test_passages = TestPassage.create! [{ user_id: users[0].id, test_id: tests[0].id }]
