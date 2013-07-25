class Service < ActiveRecord::Base
  validates_presence_of :code
  validates_uniqueness_of :code

  has_many :projects
  has_many :appropriations

end
