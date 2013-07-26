class Localization < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :abbreviation

  has_many :projects

  def name
    self.abbreviation
  end

end
