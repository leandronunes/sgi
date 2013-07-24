class Appropriation < ActiveRecord::Base
  validates_presence_of :service_id

  belongs_to :service
  belongs_to :worker
  belongs_to :task_type
  belongs_to :activity
  belongs_to :time_type
  belongs_to :input

end
