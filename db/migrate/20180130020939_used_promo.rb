class UsedPromo < ActiveRecord::Migration
  def change
      add_column :promos, :used, :integer, :default => 0
  end
end
