# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create!(name: 'Web Client', redirect_uri: '', scopes: '')
  Doorkeeper::Application.create!(name: 'iOS Client', redirect_uri: '', scopes: '')
  Doorkeeper::Application.create!(name: 'Android Client', redirect_uri: '', scopes: '')
  Doorkeeper::Application.create!(name: 'React', redirect_uri: '', scopes: '')
end

User.first_or_create(email: 'tetyana@example.com',
                     password: 'password',
                     password_confirmation: 'password',
                     role: User.roles[:admin])
