class Assignment < ActiveRecord::Base
  # attr_accessible :title, :body
belongs_to :student
belongs_to :project

end
