class ChangePromo < ActiveRecord::Migration
  def change
      add_column :promos, :maximum, :integer, :default => 0
      add_column :promos, :code, :string
  end
end
