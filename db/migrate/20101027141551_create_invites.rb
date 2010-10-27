class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |i|
      i.belongs_to :application, :null => false
      i.string :email, :null => false
      i.timestamps
    end

    add_index :invites, :application_id
  end

  def self.down
    drop_table :invites
  end
end
