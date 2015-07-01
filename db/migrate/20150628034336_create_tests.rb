class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :test_number
      t.float :score
            

      t.timestamps null: false
    end
  end
end
