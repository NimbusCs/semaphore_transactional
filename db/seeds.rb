# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [{name: 'Jose Perez', nickname: 'josep1', email: 'josepe@example.com', password: '1234567'},{name: 'Mario Silva', nickname: 'marios1', email: 'marios@example.com', password: '1234567'},{name: 'Diana Moreno', nickname: 'dianam1', email: 'dianam@example.com', password: '1234567'}]

created_users = User.create(users)

if User.all.present?
    User.all.each do |u|
        u.accounts.build(balance: rand(1000..2000)).save
    end
end