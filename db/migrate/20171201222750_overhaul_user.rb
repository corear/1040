class OverhaulUser < ActiveRecord::Migration
  def change
    remove_column :users, :enrolled
    remove_column :users, :progress
    remove_column :users, :question
    remove_column :users, :grade
    add_column :users, :enrolled, :boolean, :default => false
    add_column :users, :progress, :integer, :default => 0
  end
end
