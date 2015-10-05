firebase = Firebase::Client.new("https://ember-many-three.firebaseio.com")
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

tasks = [
  name: 'Task A'
]

tasks.each do |task|
  Task.create(task)
end