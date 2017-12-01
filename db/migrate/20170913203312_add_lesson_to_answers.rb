class AddLessonToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :lesson, :integer
  end
end
