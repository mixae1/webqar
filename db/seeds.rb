# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

return if User.first.present?
admin = User.create!(email: 'mixaetel@gmail.com', password: "ssdfghjk")
circuit = PrivateCircuit.create!(title: 'First circuit', description: 'for to test "show" of published circuits', user_id: admin.id)
PublishedCircuit.create!(private_circuit_id: circuit.id)