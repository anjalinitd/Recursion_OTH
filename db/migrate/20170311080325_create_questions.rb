class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :statement
      t.string :imageurl
      t.string :answer

      t.timestamps
    end
  end
end
