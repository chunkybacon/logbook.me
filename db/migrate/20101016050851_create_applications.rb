class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.integer :user_id, :null => false
      
      t.string :name,     :null => false
      t.string :api_key,  :null => false

      t.timestamps
    end

    add_index :applications, :user_id
    add_index :applications, :api_key, :unique => true
  end

  def self.down
    drop_table :applications
  end
end
