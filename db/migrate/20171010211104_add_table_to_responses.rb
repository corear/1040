class AddTableToResponses < ActiveRecord::Migration
  def change
      add_column :responses, :question_id, :integer
      add_column :responses, :user_id, :integer
      add_column :responses, :content, :string
  end
end
