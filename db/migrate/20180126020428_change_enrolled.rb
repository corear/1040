class ChangeEnrolled < ActiveRecord::Migration
  def change
    change_column :users, :enrolled, :boolean, :default => true
  end
end
