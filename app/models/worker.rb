class Worker < ActiveRecord::Base
  validates_presence_of :name
  has_many :appropriations
end
