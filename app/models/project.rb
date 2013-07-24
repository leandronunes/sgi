class Project < ActiveRecord::Base
  belongs_to :priority
  belongs_to :state
  belongs_to :situation
  belongs_to :process_type
  belongs_to :ss_type

end
