class Project < ActiveRecord::Base
  attr_accessible :name, :photo, :student_ids 
  has_many :assignments
  has_many :students, through: :assignments 
 
 
 
  

end
