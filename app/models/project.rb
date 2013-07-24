class Project < ActiveRecord::Base
  validates_presence_of :service_code
  validates_presence_of :project_code
  validates_uniqueness_of :project_code

  belongs_to :priority
  belongs_to :state
  belongs_to :situation
  belongs_to :process_type
  belongs_to :ss_type

end
