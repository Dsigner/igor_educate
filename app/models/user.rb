class User < ActiveRecord::Base
attr_accessible :name, :photo
has_many :points  
has_many :badges , through: :levels 
has_many :levels  
has_many :responsibilities
has_many :roles, through: :responsibilities
def change_points(options)
  if Gioco::Core::TYPES
    type_id = options[:type]
    points  = options[:points]
  else
    points  = options
  end
  type      = (type_id) ? Type.find(type_id) : false

  if Gioco::Core::TYPES
    raise "Missing Type Identifier argument" if !type_id
    old_pontuation  = self.points.where(:type_id => type_id).sum(:value)
  else
    old_pontuation  = self.points.to_i
  end
  new_pontuation    = old_pontuation + points
  Gioco::Core.sync_resource_by_points(self, new_pontuation, type)
end

def next_badge?(type_id = false)
  type              = (type_id) ? Type.find(type_id) : false
  if Gioco::Core::TYPES
    raise "Missing Type Identifier argument" if !type_id
    old_pontuation  = self.points.where(:type_id => type_id).sum(:value)
  else
    old_pontuation  = self.points.to_i
  end
  next_badge       = Badge.where("points > #{old_pontuation}").order("points ASC").first
  last_badge_point = self.badges.last.try('points')
  last_badge_point ||= 0

  if next_badge
    percentage      = (old_pontuation - last_badge_point)*100/(next_badge.points - last_badge_point)
    points          = next_badge.points - old_pontuation
    next_badge_info = { 
                        :badge      => next_badge,
                        :points     => points,
                        :percentage => percentage
                      }
  end
end
 
 devise :database_authenticatable, :registerable,
 :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :student_ids, :name
 end
 
  
  
  
  
  
  # require 'role_model'
  # ROLES = %w[admin moderator author banned]
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # Setup accessible (or protected) attributes for your model
 
  # attr_accessible :title, :body

  # 
  # has_many :roles
  # has_many :students, through: :roles
  # has_many :instructors, through: :roles

  # def roles=(roles)
  #     self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  #   end
  # 
  #   def roles
  #     ROLES.reject do |r|
  #       ((roles_mask || 0) & 2**ROLES.index(r)).zero?
  #     end
  #   end
  #   
  #   # in models/user.rb
  #   def is?(role)
  #     roles.include?(role.to_s)
  #   end 
  #   
  #     attr_accessor :roles_mask   # just for demo purposes
  #     # in real life this would usually be a persistent attribute,
  #     # e.g. if your User model is persisted in a SQL-DB add an integer
  #     # column named roles_mask to your users table -- just remove/replace
  #     # above attr_accessor line with whatever is needed for your
  #     # persistence solution
  # 
  #     include RoleModel
  # 
  #     # if you want to use a different integer attribute to store the
  #     # roles in, set it with roles_attribute :my_roles_attribute,
  #     # :roles_mask is the default name
  #     roles_attribute :roles_mask
  #     
  #     # declare the valid roles -- do not change the order if you add more
  #       # roles later, always append them at the end!
  #       roles :student, :instructor
  #if current_user.student?

  # do something
  #end

  #if current_user.try(:admin?)
  # do something
  #end

  #current_user.update_attribute :student, true

