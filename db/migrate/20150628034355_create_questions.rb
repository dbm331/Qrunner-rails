class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_number
      t.text :prompt
      t.string :image      

      t.timestamps
    end
  end
end
