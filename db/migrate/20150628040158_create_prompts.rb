class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
    
      t.string :prompt_text
      t.belongs_to :question, index: true
      t.timestamps
    end
  end
end
