class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :enrolled, :boolean
  end
end
