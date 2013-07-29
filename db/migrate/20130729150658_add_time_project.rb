class AddTimeProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :time, :float
  end

  def self.down
    drop_column :projects, :time
  end
end
