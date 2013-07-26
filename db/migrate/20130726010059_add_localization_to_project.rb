class AddLocalizationToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :localization_id, :integer
  end

  def self.down
    remove_column :projects, :localization_id
  end
end
