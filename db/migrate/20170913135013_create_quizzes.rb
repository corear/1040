class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :ref

      t.timestamps null: false
    end
  end
end
