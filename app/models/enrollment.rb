class Enrollment < ActiveRecord::Base
  attr_accessible :course_id, :group_id

  belongs_to :course
  belongs_to :group
end
