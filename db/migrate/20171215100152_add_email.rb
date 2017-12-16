class AddEmail < ActiveRecord::Migration
  def change
    add_column :users, :two_week, :boolean, :default => "false"
  end
end
