class LOlfuck < ActiveRecord::Migration
  def change
      add_column :lessons, :cover, :string
  end
end
