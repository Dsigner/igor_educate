class Instructor < ActiveRecord::Base
  attr_accessible :name, :photo



 has_many :assignments
 has_many :projects, through: :assignments
 belongs_to :user
 belongs_to :role

 attr_accessor :roles_mask   # just for demo purposes
   # in real life this would usually be a persistent attribute,
   # e.g. if your User model is persisted in a SQL-DB add an integer
   # column named roles_mask to your users table -- just remove/replace
   # above attr_accessor line with whatever is needed for your
   # persistence solution

   include RoleModel

   # if you want to use a different integer attribute to store the
   # roles in, set it with roles_attribute :my_roles_attribute,
   # :roles_mask is the default name
   roles_attribute :roles_mask

   # declare the valid roles -- do not change the order if you add more
   # roles later, always append them at the end!
   roles :student, :instructor

end
