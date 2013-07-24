class Project < ActiveRecord::Base
  validates_presence_of :code
  validates_uniqueness_of :code
  validates_presence_of :service_id

  belongs_to :priority
  belongs_to :state
  belongs_to :situation
  belongs_to :process_type
  belongs_to :ss_type
  belongs_to :service

end
