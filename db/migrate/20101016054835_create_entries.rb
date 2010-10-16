class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :application_id, :null => false

      t.string :severity,        :null => false
      t.string :facility,        :null => false
      
      t.text :payload,           :null => false

      t.timestamps
    end

    add_index :entries, :application_id
  end

  def self.down
    drop_table :entries
  end
end
