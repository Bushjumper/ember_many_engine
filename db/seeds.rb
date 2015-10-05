firebase = Firebase::Client.new("https://" + 'ember-many-three' + ".firebaseio.com")
firebase.set("/", nil)

people = [
  {
    name: 'Graeme'
  },
  {
    name: 'Don'
  }
]

people.each do |person|
  Person.create(person)
end