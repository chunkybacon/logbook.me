class CreateMembershipsForExistingUsers < ActiveRecord::Migration
  def self.up
    Application.find_each do |app|
      app.application_memberships.create(:user_id => app.user_id, :owner => true)
    end
  end

  def self.down
    ApplicationMembership.destroy_all
  end
end
