# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = [
  [ "Ada Lovelace", "ada@example.com" ],
  [ "Grace Hopper", "grace@example.com" ],
  [ "Alan Turing", "alan@example.com" ],
  [ "Katherine Johnson", "katherine@example.com" ],
  [ "Linus Torvalds", "linus@example.com" ]
]

users.each do |name, email|
  User.find_or_create_by!(email: email) do |user|
    user.name = name
  end
end
