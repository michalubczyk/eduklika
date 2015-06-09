class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.integer :post_id
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
