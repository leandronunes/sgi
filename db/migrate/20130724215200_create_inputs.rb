class CreateInputs < ActiveRecord::Migration
  def self.up
    create_table :inputs do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :inputs
  end
end
