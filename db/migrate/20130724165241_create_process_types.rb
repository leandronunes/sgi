class CreateProcessTypes < ActiveRecord::Migration
  def self.up
    create_table :process_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :process_types
  end
end
