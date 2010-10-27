class RemoveUserIdFromApplications < ActiveRecord::Migration
  def self.up
    remove_column :applications, :user_id
  end

  def self.down
    add_column :applications, :user_id, :integer, :null => false
  end
end
