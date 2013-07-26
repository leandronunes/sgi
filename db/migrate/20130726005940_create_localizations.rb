class CreateLocalizations < ActiveRecord::Migration
  def self.up
    create_table :localizations do |t|
      t.string :name, :abbreviation

      t.timestamps
    end
  end

  def self.down
    drop_table :localizations
  end
end
