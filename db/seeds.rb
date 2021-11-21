# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(name: 'Admin')
circuit = PrivateCircuit.create(title: 'First circuit', description: 'for to test "show" of published circuits', user_id: admin.id)
PublishedCircuit.create(circuit_id: circuit.id)