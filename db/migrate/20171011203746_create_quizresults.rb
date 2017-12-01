class CreateQuizresults < ActiveRecord::Migration
  def change
    create_table :quizresults do |t|
      t.integer :correct
      t.integer :user_id
      t.integer :quiz_id
      t.integer :total

      t.timestamps null: false
    end
  end
end
