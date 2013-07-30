class HardIndexingProcess < ActiveRecord::Migration

  def self.up
    add_index :projects, :priority_id
    add_index :projects, :state_id
    add_index :projects, :situation_id
    add_index :projects, :process_type_id
    add_index :projects, :ss_type_id
    add_index :projects, :service_id
    add_index :projects, :localization_id
  end

  def self.down
    remove_index :projects, :priority_id
    remove_index :projects, :state_id
    remove_index :projects, :situation_id
    remove_index :projects, :process_type_id
    remove_index :projects, :ss_type_id
    remove_index :projects, :service_id
    remove_index :projects, :localization_id
  end

end
