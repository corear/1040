class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :correct
      t.string :user_id
      t.string :quiz_id

      t.timestamps null: false
    end
  end
end
