class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :course_id
      t.integer :group_id

      t.timestamps null: false
    end
  	add_index :enrollments, ["course_id", "group_id"]    
  end
end