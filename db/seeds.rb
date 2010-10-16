# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
#
u   = User.create(:email => "test@logbook.me", :password => "123456", :password_confirmation => "123456")
app = u.applications.create(:name => "Test App")
FACILITIES = %w(important geocode kitchen server garage web)


1000.times do
  payload = Hash[*Faker::Lorem.words(6).collect { |v| [v, v*2] }.flatten]
  Entry.create(:application_id => app.id, :severity => Entry::SEVERITY_TYPES.rand, :facility => FACILITIES.rand, :payload => payload, :timestamp => Time.now)
end
