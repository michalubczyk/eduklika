class Group < ActiveRecord::Base
  attr_accessible :name, :specialization

  has_many :enrollments
  has_many :courses, :through => :enrollments

  def group_full_name
    "#{name} ( #{specialization} )"
  end	
end
