# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.all[0]
u.scores.create(test_name:"SAT", test_score:1208)
u.scores.create(test_name:"ACT", test_score:29)
u.scores.create(test_name:"AFQT", test_score:76)
u = User.all[1]
u.scores.create(test_name:"SAT", test_score:932)
u.scores.create(test_name:"ACT", test_score:24)
u.scores.create(test_name:"AFQT", test_score:58)
u = User.all[2]
u.scores.create(test_name:"SAT", test_score:1121)
u.scores.create(test_name:"ACT", test_score:30)
u.scores.create(test_name:"AFQT", test_score:63)
u = User.all[3]
u.scores.create(test_name:"SAT", test_score:1360)
u.scores.create(test_name:"ACT", test_score:33)
u.scores.create(test_name:"AFQT", test_score:87)