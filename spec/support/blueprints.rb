require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.name  { Faker::Name.name }
Sham.email { Faker::Internet.email }

User.blueprint do
  email
  password { 'password' }
  password_confirmation { 'password' }
end

Application.blueprint do
  name
  time_zone { 'Moscow' }
end

ApplicationMembership.blueprint do
  application
  user
end

Invite.blueprint do
  application
  email
end
