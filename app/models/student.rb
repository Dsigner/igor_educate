class Student < User
  attr_accessible :name, :photo 
 # devise :database_authenticatable, :registerable, :confirmable, :recoverable, :stretches => 20
 
  #before_filter :authenticate_user!
  #user_signed_in?

  #current_user

  #user_session
  
  has_many :assignments
  has_many :projects, through: :assignments
  has_one :student_profile
  def photo
  end
  # attr_accessor :roles_mask   # just for demo purposes
  #    # in real life this would usually be a persistent attribute,
  #    # e.g. if your User model is persisted in a SQL-DB add an integer
  #    # column named roles_mask to your users table -- just remove/replace
  #    # above attr_accessor line with whatever is needed for your
  #    # persistence solution
  # 
  #    include RoleModel
  # 
  #    # if you want to use a different integer attribute to store the
  #    # roles in, set it with roles_attribute :my_roles_attribute,
  #    # :roles_mask is the default name
  #    roles_attribute :roles_mask
  # 
  #    # declare the valid roles -- do not change the order if you add more
  #    # roles later, always append them at the end!
  #    roles :student, :instructor

end
