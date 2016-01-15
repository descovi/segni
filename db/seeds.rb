# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Surface.create(name: 'Olio su tela')
  Surface.create(name: 'Olio su compensato')
  Surface.create(name: 'Acrilico su tela')
  Surface.create(name: 'Acrilico su compensato')
  Surface.create(name: 'Tecnica mista')
  Surface.create(name: 'Tecnica mista su lamiera')
  Surface.create(name: 'Affresco')



  Subject.create(name: 'Paesaggio')
  Subject.create(name: 'Volti/ritratti')
  Subject.create(name: 'Figure Umane')
  Subject.create(name: 'Animali')
  Subject.create(name: 'Forme')
