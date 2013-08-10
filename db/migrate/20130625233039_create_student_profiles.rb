class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
      t.string :name
      t.string :avatar
      t.text :about_me

      t.timestamps
    end
  end
end
