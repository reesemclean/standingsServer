# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

league = League.create({name: 'League name'})

team = Team.create({name: 'Team name'})
team.league = league

result = Result.create({date: Date.today})

resultParticipant = ResultParticipant.create({})
resultParticipant.result = result
resultParticipant.team = team
resultParticipant.status = :lost
