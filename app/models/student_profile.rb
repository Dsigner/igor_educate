class StudentProfile < ActiveRecord::Base
  attr_accessible :about_me, :avatar, :name

belongs_to :student
end
