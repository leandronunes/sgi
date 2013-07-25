class CreateAppropriations < ActiveRecord::Migration
  def self.up
    create_table :appropriations do |t|
      t.datetime :date
      t.float :time
      t.belongs_to :project
      t.belongs_to :worker
      t.belongs_to :task_type
      t.belongs_to :activity
      t.belongs_to :time_type
      t.belongs_to :input

      t.timestamps
    end
  end

  def self.down
    drop_table :appropriations
  end
end
