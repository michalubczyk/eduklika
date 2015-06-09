class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :course_id
      t.string :title
      t.text :description
      t.string :tag

      t.timestamps null: false
    end
  end
end
