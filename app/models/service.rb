class Service < ActiveRecord::Base
  validates_presence_of :code
  validates_uniqueness_of :code

  has_many :projects, :dependent => :destroy
  has_many :appropriations

end
