class CreateApplicationMemberships < ActiveRecord::Migration
  def self.up
    create_table :application_memberships do |m|
      m.belongs_to :application, :null => false
      m.belongs_to :user, :null => false
      m.boolean :owner, :default => false
      m.timestamps
    end
    add_index :application_memberships, :application_id
    add_index :application_memberships, :user_id
  end

  def self.down
    drop_table :application_memberships
  end
end
