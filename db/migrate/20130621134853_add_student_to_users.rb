class AddStudentToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :student, :boolean, :default => false
  end

  def self.down
    remove_column :users, :student

  end
end
