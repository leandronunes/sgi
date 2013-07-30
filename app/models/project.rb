class Project < ActiveRecord::Base
  validates_presence_of :code
  validates_uniqueness_of :code
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :service_id
#  validates_presence_of :localization_id

  belongs_to :priority
  belongs_to :state
  belongs_to :situation
  belongs_to :process_type
  belongs_to :ss_type
  belongs_to :service
  belongs_to :localization

  has_many :appropriations, :dependent => :destroy

end
