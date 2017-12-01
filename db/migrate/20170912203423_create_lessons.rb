class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.text :title
      t.text :video
      t.text :description

      t.timestamps null: false
    end
  end
end
