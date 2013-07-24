class CreateTimeTypes < ActiveRecord::Migration
  def self.up
    create_table :time_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :time_types
  end
end
