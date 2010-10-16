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
  user
  name
end

Entry.blueprint do
  severity { 'INFO' }
  facility { 'standard' }
  payload  { { :message => 'whatever' } }
end