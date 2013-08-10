class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.timestamps
      t.belongs_to :student
      t.belongs_to :project
    end
  end
end
