# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
today = Date.today
two_days_ago = Date.today - 2.days
three_days_ago = Date.today - 3.days
dates = [today, two_days_ago, three_days_ago]

User.destroy_all
Todolist.destroy_all

100.times { |index| Todolist.create! list_name: "List #{index}", list_due: dates.sample }

Todolist.all.each do |list|
  list.todoitems.create! [
    { title: "Task 1", item_due: dates.sample, description: "very important task TEST", completed: false },
    { title: "Task 2", item_due: dates.sample, description: "do something else TEST", completed: true},
    { title: "Task 3", item_due: dates.sample, description: "learn Action Pack TEST", completed: true}
  ]
end

users = User.create! [
  { username: "jim", password: "abc123" },
  { username: "rich", password: "123abc" }
]

Todolist.all.each do |list|
  list.user = users.sample
  list.save!
end