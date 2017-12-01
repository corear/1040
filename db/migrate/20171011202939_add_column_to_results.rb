class AddColumnToResults < ActiveRecord::Migration
  def change
      add_column :results, :total, :integer
  end
end
