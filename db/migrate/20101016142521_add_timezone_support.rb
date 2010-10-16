class AddTimezoneSupport < ActiveRecord::Migration
  def self.up
    add_column :entries, :timestamp, :datetime
    add_column :applications, :time_zone, :string
  end

  def self.down
    remove_column :entries, :timestamp
    remove_column :applications, :timezone
  end
end
