class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.float :fp_predicted, :fp_realized
      t.datetime :begin_date_predicted, :end_date_predicted, :begin_date_realized, :end_date_realized
      t.string :code
      t.belongs_to :priority, :state, :situation, :process_type, :ss_type

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
