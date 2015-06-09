class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :function
      t.integer :group_id
      t.string :avatar

      t.timestamps null: false
    end
  end
end
